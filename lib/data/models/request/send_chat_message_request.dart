class SendChatMessageRequest {
  final String messageType; // TEXT, VOICE, etc
  final String? messageContent;
  final String? fileUrl;

  SendChatMessageRequest({
    required this.messageType,
    this.messageContent,
    this.fileUrl,
  });

  Map<String, dynamic> toJson() => {
    'messageType': messageType,
    'messageContent': messageContent,
    'fileUrl': fileUrl,
  };
}
