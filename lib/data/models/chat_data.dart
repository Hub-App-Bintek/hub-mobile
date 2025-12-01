import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pkp_hub/data/models/sender.dart';

part 'chat_data.freezed.dart';
part 'chat_data.g.dart';

@freezed
class ChatData with _$ChatData {
  const factory ChatData({
    String? roomId,
    Sender? sender,
    String? messagePreview,
    String? timestamp,
    bool? read,
    String? priority,
    String? chatType,
  }) = _ChatData;

  factory ChatData.fromJson(Map<String, dynamic> json) =>
      _$ChatDataFromJson(json);
}
