import 'package:freezed_annotation/freezed_annotation.dart';

part 'document_exchange.freezed.dart';
part 'document_exchange.g.dart';

@freezed
class DocumentExchange with _$DocumentExchange {
  const factory DocumentExchange({
    String? currentDed,
    String? currentBoq,
    String? currentRab,
    List? exchangeHistory,
  }) = _DocumentExchange;

  factory DocumentExchange.fromJson(Map<String, dynamic> json) =>
      _$DocumentExchangeFromJson(json);
}
