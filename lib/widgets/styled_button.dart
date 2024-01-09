import 'package:flutter/material.dart';
import 'package:canal/constants/sizes.dart';
/// fully configurable button
/// 
/// TODO disabled settings
class StyledButton extends StatelessWidget {
  /// NOTE using gradient background instead of some
  ///      Color parameters
  const StyledButton({
    super.key,
    this.onPressed,
    required this.text,
    /// optional styling
    ///this.height = Sizes.p48,
    this.enabled = true,
    this.borderRadius = Sizes.p4,
    this.fontSize = Sizes.p16,
    this.backgroundColor = Colors.teal,
    this.fontColor = Colors.black45, /// used as foregroundColor for gradient
    this.disabledColor = Colors.grey,
  });

  final bool enabled;
  ///final double height;
  final double fontSize;
  final double borderRadius;
  final MaterialColor backgroundColor;
  final Color fontColor; /// (??? - what is the deal with no MaterialColor.black)
  final MaterialColor disabledColor;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final isEnabled = onPressed != null; 
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: isEnabled ? const BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF0D47A1),
                      Color(0xFF1976D2),
                      Color(0xFF42A5F5),
                    ]
                  )
              ) : null,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              disabledBackgroundColor: disabledColor,
              foregroundColor: fontColor,
              padding: const EdgeInsets.all(Sizes.p12),
              textStyle: TextStyle(fontSize: fontSize, color: fontColor)
            ),
            onPressed: onPressed, 
            child: Text(text)
          )
        ],
      )
    );
  }
}