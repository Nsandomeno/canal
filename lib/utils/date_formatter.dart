import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateFormatterProvider = Provider<DateFormat>((ref) {
  /// Date formatter to be used in the app.
  return DateFormat.MMMEd();
});
