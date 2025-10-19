import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'portfolio.freezed.dart';
part 'portfolio.g.dart';

@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    required int id,
    required String projectName,
    required int price,
    required String detailDescription,
    required List<String> imageUrls,
    required DateTime createdAt,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);
}

extension PortfolioX on Portfolio {
  String get primaryImage => imageUrls.isNotEmpty ? imageUrls.first : '';

  String get formattedPrice {
    final fmt = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'IDR ',
      decimalDigits: 0,
    );
    return fmt.format(price);
  }
}
