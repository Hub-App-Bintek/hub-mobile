# Chat Module Flutter Integration Guideline (Direct Chat Only)

## Overview
This guideline provides instructions for Flutter frontend team to integrate with the chat module backend APIs for direct chat functionality between Home Owner and Consultant. The system supports real-time messaging via WebSocket and REST API operations for message management.

## Architecture Overview

### Components
- **WebSocket Controller**: Handles real-time messaging using STOMP protocol
- **Chat Message Controller**: REST API for message operations
- **Chat Room Controller**: REST API for direct chat room management
- **Models**: ChatMessage, ChatRoom entities
- **DTOs**: Data transfer objects for API communication

### Key Features
- Direct (peer-to-peer) chat between Home Owner and Consultant
- Real-time messaging via WebSocket
- Message types: TEXT, VOICE
- File attachments support
- Read receipts

## Authentication
All API endpoints require JWT authentication via `Authorization` header:
```
Authorization: Bearer <jwt_token>
```

## WebSocket Integration

### Connection Setup
```dart
// Use stomp_dart_client or similar WebSocket STOMP client
import 'package:stomp_dart_client/stomp_dart_client.dart';

// Connect to WebSocket endpoint
final stompClient = StompClient(
  config: StompConfig(
    url: 'ws://your-backend-url/ws',
    onConnect: onConnect,
    onWebSocketError: (dynamic error) => print(error.toString()),
    stompConnectHeaders: {
      'Authorization': 'Bearer $jwtToken',
    },
    webSocketConnectHeaders: {
      'Authorization': 'Bearer $jwtToken',
    },
  ),
);

stompClient.activate();
```

### WebSocket Endpoints

#### Send Message
**Endpoint**: `/app/chat/{roomId}/send`
**Method**: STOMP SEND
**Payload**: `ChatMessagePayload`

```dart
// Send message
stompClient.send(
  destination: '/app/chat/$roomId/send',
  body: jsonEncode({
    'messageType': 'TEXT', // or 'VOICE'
    'messageContent': 'Hello World',
    'fileUrl': null, // optional
  }),
);
```

#### Mark Message as Read
**Endpoint**: `/app/chat/{roomId}/read/{messageId}`
**Method**: STOMP SEND

```dart
// Mark message as read
stompClient.send(
  destination: '/app/chat/$roomId/read/$messageId',
  body: null,
);
```

#### Subscribe to Messages
**Endpoint**: `/topic/chat/{roomId}`
**Method**: STOMP SUBSCRIBE

```dart
// Subscribe to room messages
final subscription = stompClient.subscribe(
  destination: '/topic/chat/$roomId',
  callback: (StompFrame frame) {
    final message = ChatMessageResponse.fromJson(jsonDecode(frame.body!));
    // Handle incoming message
  },
);
```

#### Subscribe to Read Receipts
**Endpoint**: `/topic/chat/{roomId}/read`
**Method**: STOMP SUBSCRIBE

```dart
// Subscribe to read status updates
final readSubscription = stompClient.subscribe(
  destination: '/topic/chat/$roomId/read',
  callback: (StompFrame frame) {
    final readStatus = jsonDecode(frame.body!);
    // Handle read status update
  },
);
```

## REST API Integration

### Base URL
All REST APIs are prefixed with `/api/v1`

### Chat Message APIs

#### Send Message
**Endpoint**: `POST /api/v1/chats/{consultationId}/messages`
**Authorization**: Required (HOME_OWNER or CONSULTANT)
**Content-Type**: `multipart/form-data`

**Request Parameters**:
- `messageType` (String): "TEXT" or "VOICE"
- `messageContent` (String, optional): Text content
- `voiceFile` (MultipartFile, optional): Voice file for VOICE type

**Response**: `ChatMessageDTO` (201 Created)

```dart
// Example implementation
Future<ChatMessageDTO> sendMessage(
  String consultationId,
  String messageType,
  String? messageContent,
  File? voiceFile,
) async {
  final uri = Uri.parse('$baseUrl/api/v1/chats/$consultationId/messages');

  final request = http.MultipartRequest('POST', uri)
    ..headers['Authorization'] = 'Bearer $jwtToken'
    ..fields['messageType'] = messageType;

  if (messageContent != null) {
    request.fields['messageContent'] = messageContent;
  }

  if (voiceFile != null) {
    request.files.add(await http.MultipartFile.fromPath(
      'voiceFile',
      voiceFile.path,
    ));
  }

  final response = await request.send();
  final responseData = await response.stream.bytesToString();

  if (response.statusCode == 201) {
    return ChatMessageDTO.fromJson(jsonDecode(responseData));
  } else {
    throw Exception('Failed to send message');
  }
}
```

#### Get Chat Messages
**Endpoint**: `GET /api/v1/chats/{consultationId}/messages`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Response**: `List<ChatMessageDTO>` (200 OK)

```dart
Future<List<ChatMessageDTO>> getChatMessages(String consultationId) async {
  final response = await http.get(
    Uri.parse('$baseUrl/api/v1/chats/$consultationId/messages'),
    headers: {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ChatMessageDTO.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load messages');
  }
}
```

#### Get Latest Message
**Endpoint**: `GET /api/v1/chats/{consultationId}/messages/latest`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Response**: `ChatMessageDTO` (200 OK)

#### Mark Message as Read
**Endpoint**: `PATCH /api/v1/chats/{consultationId}/messages/{messageId}/read`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Response**: 200 OK

```dart
Future<void> markMessageAsRead(String consultationId, String messageId) async {
  final response = await http.patch(
    Uri.parse('$baseUrl/api/v1/chats/$consultationId/messages/$messageId/read'),
    headers: {
      'Authorization': 'Bearer $jwtToken',
    },
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to mark message as read');
  }
}
```

### Chat Room APIs

#### Create Direct Chat
**Endpoint**: `POST /api/v1/chat/rooms/direct/{targetUserId}`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Response**: `ChatRoomResponse` (201 Created)

```dart
Future<ChatRoomResponse> createDirectChat(int targetUserId) async {
  final response = await http.post(
    Uri.parse('$baseUrl/api/v1/chat/rooms/direct/$targetUserId'),
    headers: {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 201) {
    return ChatRoomResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create direct chat');
  }
}
```

#### Get User Chat Rooms
**Endpoint**: `GET /api/v1/chat/rooms`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Query Parameters**:
- `type` (String, optional): Filter by room type (use "DIRECT" for direct chats)

**Response**: `List<ChatRoomResponse>` (200 OK)

```dart
Future<List<ChatRoomResponse>> getUserChatRooms() async {
  final uri = Uri.parse('$baseUrl/api/v1/chat/rooms').replace(queryParameters: {'type': 'DIRECT'});

  final response = await http.get(
    uri,
    headers: {
      'Authorization': 'Bearer $jwtToken',
      'Content-Type': 'application/json',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => ChatRoomResponse.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load chat rooms');
  }
}
```

#### Get Chat Room Details
**Endpoint**: `GET /api/v1/chat/rooms/{roomId}`
**Authorization**: Required (HOME_OWNER or CONSULTANT)

**Response**: `ChatRoomResponse` (200 OK) or 404 Not Found

## Data Models

### ChatMessageDTO
```dart
class ChatMessageDTO {
  final String id;
  final String consultationId;
  final int senderId;
  final int? receiverId;
  final String messageType; // "TEXT" or "VOICE"
  final String? messageContent;
  final String? fileUrl;
  final bool isRead;
  final DateTime createdAt;

  ChatMessageDTO({
    required this.id,
    required this.consultationId,
    required this.senderId,
    this.receiverId,
    required this.messageType,
    this.messageContent,
    this.fileUrl,
    required this.isRead,
    required this.createdAt,
  });

  factory ChatMessageDTO.fromJson(Map<String, dynamic> json) {
    return ChatMessageDTO(
      id: json['id'],
      consultationId: json['consultationId'],
      senderId: json['senderId'],
      receiverId: json['receiverId'],
      messageType: json['messageType'],
      messageContent: json['messageContent'],
      fileUrl: json['fileUrl'],
      isRead: json['isRead'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
```

### ChatMessageResponse
```dart
class ChatMessageResponse {
  final String id;
  final String consultationId;
  final int senderId;
  final String? senderName;
  final int? receiverId;
  final String messageType;
  final String? messageContent;
  final String? fileUrl;
  final String? fileName;
  final int? fileSize;
  final bool isRead;
  final DateTime? readAt;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ChatMessageResponse({
    required this.id,
    required this.consultationId,
    required this.senderId,
    this.senderName,
    this.receiverId,
    required this.messageType,
    this.messageContent,
    this.fileUrl,
    this.fileName,
    this.fileSize,
    required this.isRead,
    this.readAt,
    required this.createdAt,
    this.updatedAt,
  });

  factory ChatMessageResponse.fromJson(Map<String, dynamic> json) {
    return ChatMessageResponse(
      id: json['id'],
      consultationId: json['consultationId'],
      senderId: json['senderId'],
      senderName: json['senderName'],
      receiverId: json['receiverId'],
      messageType: json['messageType'],
      messageContent: json['messageContent'],
      fileUrl: json['fileUrl'],
      fileName: json['fileName'],
      fileSize: json['fileSize'],
      isRead: json['isRead'],
      readAt: json['readAt'] != null ? DateTime.parse(json['readAt']) : null,
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
```

### ChatRoomResponse
```dart
enum ChatRoomType {
  DIRECT,
  GROUP,
}

class ChatRoomResponse {
  final String id;
  final String roomName;
  final ChatRoomType type;
  final int creatorId;
  final String? creatorName;
  final Set<int> participantIds;
  final Set<String> participantNames;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? updatedAt;

  ChatRoomResponse({
    required this.id,
    required this.roomName,
    required this.type,
    required this.creatorId,
    this.creatorName,
    required this.participantIds,
    required this.participantNames,
    required this.isActive,
    required this.createdAt,
    this.updatedAt,
  });

  factory ChatRoomResponse.fromJson(Map<String, dynamic> json) {
    return ChatRoomResponse(
      id: json['id'],
      roomName: json['roomName'],
      type: ChatRoomType.values.firstWhere(
        (e) => e.toString() == 'ChatRoomType.${json['type']}',
      ),
      creatorId: json['creatorId'],
      creatorName: json['creatorName'],
      participantIds: Set<int>.from(json['participantIds']),
      participantNames: Set<String>.from(json['participantNames']),
      isActive: json['isActive'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
```

### ChatMessagePayload
```dart
class ChatMessagePayload {
  final String? consultationId;
  final int? senderId;
  final int? receiverId;
  final String messageType;
  final String? messageContent;
  final String? fileUrl;

  ChatMessagePayload({
    this.consultationId,
    this.senderId,
    this.receiverId,
    required this.messageType,
    this.messageContent,
    this.fileUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'consultationId': consultationId,
      'senderId': senderId,
      'receiverId': receiverId,
      'messageType': messageType,
      'messageContent': messageContent,
      'fileUrl': fileUrl,
    };
  }
}
```

## Error Handling

### Common HTTP Status Codes
- `200 OK`: Success
- `201 Created`: Resource created successfully
- `400 Bad Request`: Invalid request parameters
- `401 Unauthorized`: Authentication required
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `500 Internal Server Error`: Server error

### Error Response Format
```json
{
  "timestamp": "2023-11-09T03:11:19.489Z",
  "status": 400,
  "error": "Bad Request",
  "message": "Validation failed",
  "path": "/api/v1/chats/123/messages"
}
```

## Best Practices

### WebSocket Management
1. **Connection Lifecycle**: Properly handle connection open/close events
2. **Reconnection**: Implement automatic reconnection on connection loss
3. **Heartbeat**: Send periodic heartbeats to maintain connection
4. **Error Handling**: Handle WebSocket errors gracefully

### Message Handling
1. **Message Ordering**: Handle message ordering and potential duplicates
2. **Offline Messages**: Fetch missed messages when reconnecting
3. **Read Receipts**: Update UI immediately when marking messages as read
4. **File Uploads**: Handle file upload progress and errors

### Room Management
1. **Room State**: Handle room deactivation and reactivation
2. **Permissions**: Respect user permissions for room operations

### Performance Considerations
1. **Pagination**: Implement pagination for message history
2. **Lazy Loading**: Load messages on demand
3. **Caching**: Cache frequently accessed data
4. **Background Processing**: Handle WebSocket messages in background isolates

## Testing

### Unit Tests
- Test data model serialization/deserialization
- Test API service methods with mocked responses
- Test WebSocket message handling

### Integration Tests
- Test complete chat flow (create room → send message → receive message)
- Test error scenarios (network failures, authentication errors)
- Test WebSocket reconnection logic

### Sample Test Cases
```dart
void main() {
  group('ChatService', () {
    test('should send text message successfully', () async {
      // Test implementation
    });

    test('should handle WebSocket message reception', () async {
      // Test implementation
    });

    test('should create direct chat room', () async {
      // Test implementation
    });

    test('should get user direct chat rooms', () async {
      // Test implementation
    });
  });
}
```

## Dependencies

Add these packages to your `pubspec.yaml`:

```yaml
dependencies:
  stomp_dart_client: ^6.0.0
  http: ^1.0.0
  json_annotation: ^4.8.1

dev_dependencies:
  json_serializable: ^6.7.1
  build_runner: ^2.4.6
```

## Security Considerations

1. **Token Management**: Securely store and refresh JWT tokens
2. **WebSocket Security**: Validate all incoming WebSocket messages
3. **Input Validation**: Validate all user inputs before sending
4. **File Upload Security**: Validate file types and sizes
5. **Rate Limiting**: Implement rate limiting for API calls

## Troubleshooting

### Common Issues

1. **WebSocket Connection Fails**
   - Check JWT token validity
   - Verify WebSocket URL and port
   - Check network connectivity

2. **Messages Not Received**
   - Verify room subscription
   - Check user permissions
   - Validate room ID

3. **File Upload Fails**
   - Check file size limits
   - Validate file types
   - Verify multipart form data

4. **Authentication Errors**
   - Refresh JWT token
   - Check token expiration
   - Verify user roles

## Support

For additional support or questions:
- Refer to backend API documentation
- Check existing Flutter implementation examples
- Contact backend team for API clarifications

---

**Version**: 1.0
**Last Updated**: 2025-11-09
**Backend API Version**: v1