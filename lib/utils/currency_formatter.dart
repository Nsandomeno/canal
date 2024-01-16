import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

String fmtDoubleToCurrencyString(double value, [String? currency]) {
  final currencyFmt = currency ?? "en_US";
  return NumberFormat.simpleCurrency(locale: currencyFmt).format(value);
}

final currencyFormatterProvider = Provider<NumberFormat>((ref) {
  /// Currency formatter
  /// * en_US is hardcoded to ensure all prices show with a dollar sign ($)
  /// * add an enum for supported currencies and pass another parameter to 
  ///   make the currency configurable.
  return NumberFormat.simpleCurrency(locale: "en_US");
});
