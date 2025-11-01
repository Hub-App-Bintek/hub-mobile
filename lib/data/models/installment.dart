// API response object for contract installment entries
// Example JSON:
// {
//   "percentage": 30.0,
//   "dueDate": "2024-12-01"
// }

import 'package:freezed_annotation/freezed_annotation.dart';

part 'installment.freezed.dart';
part 'installment.g.dart';

@freezed
class Installment with _$Installment {
  const factory Installment({
    double? percentage,
    String? dueDate, // ISO-8601 date (yyyy-MM-dd)
  }) = _Installment;

  factory Installment.fromJson(Map<String, dynamic> json) =>
      _$InstallmentFromJson(json);
}
