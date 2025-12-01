import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/chat_data.dart';
import 'package:pkp_hub/data/models/pagination.dart';

part 'incoming_chat_response.freezed.dart';
part 'incoming_chat_response.g.dart';

@freezed
class IncomingChatResponse with _$IncomingChatResponse {
  const factory IncomingChatResponse({
    bool? success,
    @Default(<ChatData>[]) List<ChatData> data,
    Pagination? metadata,
  }) = _IncomingChatResponse;

  factory IncomingChatResponse.fromJson(Map<String, dynamic> json) =>
      _$IncomingChatResponseFromJson(json);
}
