class ChatMessage {
  final String? id;
  final String? consultationId;
  final int? senderId;
  final int? receiverId;
  final String? messageType;
  final String? messageContent;
  final String? fileUrl;
  final bool? isRead;
  final String? createdAt;

  ChatMessage({
    this.id,
    this.consultationId,
    this.senderId,
    this.receiverId,
    this.messageType,
    this.messageContent,
    this.fileUrl,
    this.isRead,
    this.createdAt,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    id: json['id']?.toString(),
    consultationId: json['consultationId']?.toString(),
    senderId: json['senderId'] is int
        ? json['senderId'] as int
        : int.tryParse(json['senderId']?.toString() ?? ''),
    receiverId: json['receiverId'] is int
        ? json['receiverId'] as int
        : int.tryParse(json['receiverId']?.toString() ?? ''),
    messageType: json['messageType']?.toString(),
    messageContent: json['messageContent']?.toString(),
    fileUrl: json['fileUrl']?.toString(),
    isRead: json['isRead'] is bool
        ? json['isRead'] as bool
        : json['isRead'] == null
        ? null
        : json['isRead'].toString().toLowerCase() == 'true',
    createdAt: json['createdAt']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'consultationId': consultationId,
    'senderId': senderId,
    'receiverId': receiverId,
    'messageType': messageType,
    'messageContent': messageContent,
    'fileUrl': fileUrl,
    'isRead': isRead,
    'createdAt': createdAt,
  };
}
