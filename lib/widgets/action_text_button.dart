import 'package:flutter/material.dart';
import 'package:canal/constants/sizes.dart';

/// Text button to be used as an [AppBar] action
class ActionTextButton extends StatelessWidget {
  const ActionTextButton({
    super.key, 
    this.onPressed,
    required this.text, 
  });

  final String text;
  final VoidCallback? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white)),
      ),
    );
  }
}