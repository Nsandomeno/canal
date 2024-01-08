import 'package:canal/constants/sizes.dart';
import 'package:flutter/material.dart';

class ResponsiveInfoCard extends StatelessWidget {
  const ResponsiveInfoCard({
    super.key,
    this.color = Colors.grey,
    required this.child,
  });

  final Widget child;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Card(
          color: color,
          child: Padding( 
            padding: const EdgeInsets.all(Sizes.p16),
            child: child,
          ),
        ),
      )
    );
  }
}