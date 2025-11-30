# Chat API Documentation

This document provides a comprehensive specification for the chat system API, designed for managing incoming chat messages similar to an inbox notification system. The API follows REST principles with JWT authentication and uses `roomId` (UUID) as the chat identifier, consistent with the WebSocket implementation.

## Authentication
All endpoints require JWT token authentication via the `Authorization` header: `Bearer <token>`.

## General Error Handling
- **401 Unauthorized**: Invalid or missing JWT token
- **404 Not Found**: Resource not found (e.g., invalid roomId)
- **400 Bad Request**: Invalid request parameters or body
- **500 Internal Server Error**: Server-side error

## Rate Limiting
- 100 requests per minute per user for chat endpoints
- 10 requests per minute for message sending

---

## 1. Get Incoming Chats List

Retrieves a paginated list of incoming chat messages for the authenticated user, similar to an inbox.

### Endpoint
- **Method**: GET
- **Path**: `/api/chats/incoming`
- **Authentication**: JWT token required

### Query Parameters
- `page` (integer, optional, default: 1): Page number for pagination
- `limit` (integer, optional, default: 10, max: 100): Number of items per page
- `status` (string, optional): Filter by status ("unread", "read", "archived")
- `date_range` (string, optional): Filter by date range in format "YYYY-MM-DD to YYYY-MM-DD"
- `sort_by` (string, optional, default: "timestamp"): Sort field ("timestamp")
- `sort_order` (string, optional, default: "desc"): Sort order ("asc" or "desc")

### Response Format
```json
{
  "success": true,
  "data": [
    {
      "room_id": "uuid",
      "sender": {
        "id": "string",
        "name": "string",
        "avatar_url": "string"
      },
      "message_preview": "string",
      "timestamp": "2023-10-01T12:00:00Z",
      "is_read": false,
      "priority": "normal",
      "chat_type": "direct"
    }
  ],
  "metadata": {
    "total_items": 150,
    "total_pages": 15,
    "current_page": 1,
    "has_next": true,
    "has_prev": false
  }
}
```

### Example Response
```json
{
  "success": true,
  "data": [
    {
      "room_id": "550e8400-e29b-41d4-a716-446655440000",
      "sender": {
        "id": "user_67890",
        "name": "John Doe",
        "avatar_url": "https://example.com/avatar/john.jpg"
      },
      "message_preview": "Hello, I have a question about...",
      "timestamp": "2023-10-01T12:00:00Z",
      "is_read": false,
      "priority": "high",
      "chat_type": "direct"
    },
    {
      "room_id": "550e8400-e29b-41d4-a716-446655440001",
      "sender": {
        "id": "user_12345",
        "name": "Jane Smith",
        "avatar_url": "https://example.com/avatar/jane.jpg"
      },
      "message_preview": "Regarding the project update...",
      "timestamp": "2023-10-01T11:30:00Z",
      "is_read": true,
      "priority": "normal",
      "chat_type": "group"
    }
  ],
  "metadata": {
    "total_items": 2,
    "total_pages": 1,
    "current_page": 1,
    "has_next": false,
    "has_prev": false
  }
}
```

---

## 2. Mark Chat as Read

Marks a specific chat as read or unread.

### Endpoint
- **Method**: PATCH
- **Path**: `/api/chats/{roomId}/mark-read`
- **Authentication**: JWT token required

### Path Parameters
- `roomId` (UUID): Unique identifier of the chat room

### Request Body
```json
{
  "is_read": true
}
```

### Response Format
```json
{
  "success": true,
  "message": "Chat marked as read successfully",
  "updated_at": "2023-10-01T12:05:00Z"
}
```

---

## 3. Get Chat Room Details

Retrieves details of a specific chat room, including participants and messages.

### Endpoint
- **Method**: GET
- **Path**: `/api/chats/{roomId}/room`
- **Authentication**: JWT token required

### Path Parameters
- `roomId` (UUID): Unique identifier of the chat room

### Query Parameters
- `page` (integer, optional, default: 1): Page number for message pagination
- `limit` (integer, optional, default: 20, max: 100): Number of messages per page

### Response Format
```json
{
  "success": true,
  "data": {
    "chat_details": {
      "room_id": "uuid",
      "participants": [
        {
          "id": "string",
          "name": "string",
          "avatar_url": "string"
        }
      ]
    },
    "messages": [
      {
        "id": "uuid",
        "sender_id": "string",
        "content": "string",
        "timestamp": "2023-10-01T12:00:00Z",
        "type": "text"
      }
    ],
    "pagination": {
      "total_items": 50,
      "total_pages": 3,
      "current_page": 1,
      "has_next": true,
      "has_prev": false
    }
  }
}
```

---

## 4. Send New Message

Sends a new message to a specific chat room.

### Endpoint
- **Method**: POST
- **Path**: `/api/chats/{roomId}/messages`
- **Authentication**: JWT token required

### Path Parameters
- `roomId` (UUID): Unique identifier of the chat room

### Request Body
```json
{
  "content": "string",
  "type": "text"
}
```

### Response Format
```json
{
  "success": true,
  "data": {
    "message_id": "uuid",
    "timestamp": "2023-10-01T12:10:00Z"
  }
}
```

---

## 5. Archive Chat

Archives or unarchives a specific chat.

### Endpoint
- **Method**: PUT
- **Path**: `/api/chats/{roomId}/archive`
- **Authentication**: JWT token required

### Path Parameters
- `roomId` (UUID): Unique identifier of the chat room

### Request Body
```json
{
  "archived": true
}
```

### Response Format
```json
{
  "success": true,
  "message": "Chat archived successfully",
  "updated_at": "2023-10-01T12:15:00Z"
}
```

---

## WebSocket Integration
The chat system supports real-time messaging via WebSocket using STOMP protocol. WebSocket provides instant message delivery while REST APIs handle CRUD operations and inbox management.

### WebSocket Endpoints
- **Send Message**: `/app/chat/{roomId}/send`
- **Mark as Read**: `/app/chat/{roomId}/read/{messageId}`
- **Subscribe to Room**: `/topic/chat/{roomId}`
- **Subscribe to Read Status**: `/topic/chat/{roomId}/read`

### WebSocket Message Format

#### Send Message Payload
```json
{
  "messageType": "text",
  "messageContent": "Hello, how are you?",
  "fileUrl": null
}
```

#### Received Message Format
```json
{
  "id": "uuid",
  "consultationId": "uuid",
  "senderId": 123,
  "receiverId": 456,
  "messageType": "text",
  "messageContent": "Hello, how are you?",
  "fileUrl": null,
  "isRead": false,
  "createdAt": "2023-10-01T12:00:00Z"
}
```

#### Mark as Read Status
```json
{
  "messageId": "uuid",
  "isRead": true,
  "readBy": 123
}
```

## Sample Request Response

### 1. Get Incoming Chats
**Request:**
```
GET /api/chats/incoming?page=1&limit=10&status=unread&sort_by=timestamp&sort_order=desc
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response:**
```json
{
  "success": true,
  "data": [
    {
      "roomId": "550e8400-e29b-41d4-a716-446655440000",
      "sender": {
        "id": 456,
        "name": "John Doe",
        "avatarUrl": "https://api.example.com/avatars/john.jpg"
      },
      "messagePreview": "Hello, I have a question about the project...",
      "timestamp": "2023-10-01T12:00:00Z",
      "isRead": false,
      "priority": "high",
      "chatType": "direct"
    }
  ],
  "metadata": {
    "totalItems": 1,
    "totalPages": 1,
    "currentPage": 1,
    "hasNext": false,
    "hasPrev": false
  }
}
```

### 2. Mark Chat as Read
**Request:**
```
PATCH /api/chats/550e8400-e29b-41d4-a716-446655440000/mark-read
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "isRead": true
}
```

**Response:**
```json
{
  "success": true,
  "message": "Chat marked as read successfully",
  "updatedAt": "2023-10-01T12:05:00Z"
}
```

### 3. Get Chat Room Details
**Request:**
```
GET /api/chats/550e8400-e29b-41d4-a716-446655440000/room?page=1&limit=20
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**Response:**
```json
{
  "success": true,
  "data": {
    "roomId": "550e8400-e29b-41d4-a716-446655440000",
    "chatDetails": {
      "roomId": "550e8400-e29b-41d4-a716-446655440000",
      "participants": [
        {
          "id": 123,
          "name": "Jane Smith",
          "avatarUrl": "https://api.example.com/avatars/jane.jpg"
        },
        {
          "id": 456,
          "name": "John Doe",
          "avatarUrl": "https://api.example.com/avatars/john.jpg"
        }
      ]
    },
    "messages": [
      {
        "id": "550e8400-e29b-41d4-a716-446655440001",
        "senderId": 456,
        "content": "Hello, I have a question about the project",
        "timestamp": "2023-10-01T12:00:00Z",
        "type": "text"
      }
    ],
    "pagination": {
      "totalItems": 1,
      "totalPages": 1,
      "currentPage": 1,
      "hasNext": false,
      "hasPrev": false
    }
  }
}
```

### 4. Send Message
**Request:**
```
POST /api/chats/550e8400-e29b-41d4-a716-446655440000/messages
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "content": "Thank you for your help!",
  "type": "text"
}
```

**Response:**
```json
{
  "success": true,
  "data": {
    "messageId": "550e8400-e29b-41d4-a716-446655440002",
    "timestamp": "2023-10-01T12:10:00Z"
  }
}
```

### 5. Archive Chat
**Request:**
```
PUT /api/chats/550e8400-e29b-41d4-a716-446655440000/archive
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
Content-Type: application/json

{
  "archived": true
}
```

**Response:**
```json
{
  "success": true,
  "message": "Chat archived successfully",
  "updatedAt": "2023-10-01T12:15:00Z"
}
```

## Flutter Frontend Integration

### 1. Dependencies
Add these packages to your `pubspec.yaml`:
```yaml
dependencies:
  http: ^1.1.0
  stomp_dart_client: ^1.0.0
  shared_preferences: ^2.2.2
  provider: ^6.0.5
```

### 2. API Service Class
```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChatApiService {
  final String baseUrl = 'https://api.yourapp.com';
  late String _token;

  Future<void> _loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('jwt_token') ?? '';
  }

  Future<Map<String, String>> _getHeaders() async {
    await _loadToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_token',
    };
  }

  // Get incoming chats
  Future<IncomingChatsResponse> getIncomingChats({
    int page = 1,
    int limit = 10,
    String? status,
    String? dateRange,
    String sortBy = 'timestamp',
    String sortOrder = 'desc',
  }) async {
    final headers = await _getHeaders();
    final queryParams = {
      'page': page.toString(),
      'limit': limit.toString(),
      'sort_by': sortBy,
      'sort_order': sortOrder,
    };

    if (status != null) queryParams['status'] = status;
    if (dateRange != null) queryParams['date_range'] = dateRange;

    final uri = Uri.parse('$baseUrl/api/chats/incoming')
        .replace(queryParameters: queryParams);

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return IncomingChatsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load incoming chats');
    }
  }

  // Get chat room details
  Future<ChatRoomDetailsResponse> getChatRoomDetails(
    String roomId, {
    int page = 1,
    int limit = 20,
  }) async {
    final headers = await _getHeaders();
    final uri = Uri.parse('$baseUrl/api/chats/$roomId/room')
        .replace(queryParameters: {
      'page': page.toString(),
      'limit': limit.toString(),
    });

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return ChatRoomDetailsResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load chat room details');
    }
  }

  // Send message
  Future<SendMessageResponse> sendMessage(
    String roomId,
    String content,
    String type,
  ) async {
    final headers = await _getHeaders();
    final response = await http.post(
      Uri.parse('$baseUrl/api/chats/$roomId/messages'),
      headers: headers,
      body: json.encode({
        'content': content,
        'type': type,
      }),
    );

    if (response.statusCode == 201) {
      return SendMessageResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to send message');
    }
  }

  // Mark chat as read
  Future<MarkChatReadResponse> markChatAsRead(
    String roomId,
    bool isRead,
  ) async {
    final headers = await _getHeaders();
    final response = await http.patch(
      Uri.parse('$baseUrl/api/chats/$roomId/mark-read'),
      headers: headers,
      body: json.encode({'isRead': isRead}),
    );

    if (response.statusCode == 200) {
      return MarkChatReadResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to mark chat as read');
    }
  }

  // Archive chat
  Future<ArchiveChatResponse> archiveChat(
    String roomId,
    bool archived,
  ) async {
    final headers = await _getHeaders();
    final response = await http.put(
      Uri.parse('$baseUrl/api/chats/$roomId/archive'),
      headers: headers,
      body: json.encode({'archived': archived}),
    );

    if (response.statusCode == 200) {
      return ArchiveChatResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to archive chat');
    }
  }
}
```

### 3. WebSocket Service Class
```dart
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ChatWebSocketService {
  late StompClient _stompClient;
  final String baseUrl = 'https://hub-dev.editnest.online/ws/chat';
  late String _token;

  void connect(String token) {
    _token = token;
    _stompClient = StompClient(
      config: StompConfig(
        url: baseUrl,
        onConnect: _onConnect,
        onWebSocketError: (error) => print('WebSocket error: $error'),
        stompConnectHeaders: {'Authorization': 'Bearer $_token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $_token'},
      ),
    );
    _stompClient.activate();
  }

  void _onConnect(StompFrame frame) {
    print('Connected to WebSocket');
  }

  void disconnect() {
    _stompClient.deactivate();
  }

  // Send message via WebSocket
  void sendMessage(String roomId, String messageType, String messageContent) {
    _stompClient.send(
      destination: '/app/chat/$roomId/send',
      body: json.encode({
        'messageType': messageType,
        'messageContent': messageContent,
        'fileUrl': null,
      }),
    );
  }

  // Mark message as read via WebSocket
  void markMessageAsRead(String roomId, String messageId) {
    _stompClient.send(
      destination: '/app/chat/$roomId/read/$messageId',
      body: '',
    );
  }

  // Subscribe to room messages
  void subscribeToRoom(String roomId, Function(Map<String, dynamic>) onMessageReceived) {
    _stompClient.subscribe(
      destination: '/topic/chat/$roomId',
      callback: (frame) {
        final message = json.decode(frame.body!);
        onMessageReceived(message);
      },
    );
  }

  // Subscribe to read status updates
  void subscribeToReadStatus(String roomId, Function(Map<String, dynamic>) onReadStatusUpdate) {
    _stompClient.subscribe(
      destination: '/topic/chat/$roomId/read',
      callback: (frame) {
        final readStatus = json.decode(frame.body!);
        onReadStatusUpdate(readStatus);
      },
    );
  }
}
```

### 4. Usage Example in Flutter Widget
```dart
class ChatScreen extends StatefulWidget {
  final String roomId;

  const ChatScreen({Key? key, required this.roomId}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatApiService _apiService = ChatApiService();
  final ChatWebSocketService _wsService = ChatWebSocketService();
  late ChatRoomDetailsResponse _chatData;
  final TextEditingController _messageController = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadChatData();
    _connectWebSocket();
  }

  Future<void> _loadChatData() async {
    try {
      final data = await _apiService.getChatRoomDetails(widget.roomId);
      setState(() {
        _chatData = data;
        _isLoading = false;
      });
    } catch (e) {
      print('Error loading chat data: $e');
    }
  }

  void _connectWebSocket() {
    // Get token from shared preferences or auth service
    final token = 'your_jwt_token_here';
    _wsService.connect(token);

    // Subscribe to new messages
    _wsService.subscribeToRoom(widget.roomId, (message) {
      setState(() {
        // Add new message to chat data
        _chatData.data.messages.add(ChatMessageDTO.fromJson(message));
      });
    });

    // Subscribe to read status updates
    _wsService.subscribeToReadStatus(widget.roomId, (readStatus) {
      // Handle read status updates
      print('Message ${readStatus['messageId']} read by ${readStatus['readBy']}');
    });
  }

  Future<void> _sendMessage() async {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    try {
      // Send via REST API
      await _apiService.sendMessage(widget.roomId, content, 'text');

      // Also send via WebSocket for real-time delivery
      _wsService.sendMessage(widget.roomId, 'text', content);

      _messageController.clear();
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_chatData.data.chatDetails.participants
            .where((p) => p.id != currentUserId)
            .map((p) => p.name)
            .join(', ')),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatData.data.messages.length,
              itemBuilder: (context, index) {
                final message = _chatData.data.messages[index];
                return ListTile(
                  title: Text(message.content),
                  subtitle: Text(message.timestamp.toString()),
                  // Add more styling based on sender
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _wsService.disconnect();
    super.dispose();
  }
}
```

## Navigation Integration
When a user clicks on a chat from the incoming list, navigate to the chat room using the `GET /api/chats/{roomId}/room` endpoint to load the full conversation. The Flutter example above demonstrates this integration pattern.