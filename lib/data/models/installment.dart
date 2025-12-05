import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment.freezed.dart';
part 'installment.g.dart';

@freezed
class Installment with _$Installment {
  const factory Installment({
    double? value,
    bool? percentage,
    String? dueDate,
  }) = _Installment;

  factory Installment.fromJson(Map<String, dynamic> json) =>
      _$InstallmentFromJson(json);
}
