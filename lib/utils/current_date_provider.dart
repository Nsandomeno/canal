import 'package:flutter_riverpod/flutter_riverpod.dart';

/// a provider that returns a function that returns the current date
/// this makes it easy to mock the current date in tests
final currentDateBuilderProvider = Provider<DateTime Function()>((ref) {
  return () => DateTime.now();
});
