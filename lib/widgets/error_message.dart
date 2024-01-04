import 'package:flutter/material.dart';

/// Reusable error message widget (just a [Text] with a red color).
class ErrorMessage extends StatelessWidget {
  const ErrorMessage(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}