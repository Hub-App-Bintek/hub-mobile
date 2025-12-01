class ChatSendMessageRequest {
  ChatSendMessageRequest({required this.content, this.type = 'text'});

  final String content;
  final String type;

  Map<String, dynamic> toJson() => {'content': content, 'type': type};
}
