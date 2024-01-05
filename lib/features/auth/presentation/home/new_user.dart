import 'package:canal/widgets/decorated_box.dart';
import 'package:canal/widgets/responsive_two_column_layout.dart';
import 'package:flutter/material.dart';
//import 'package:canal/constants/breakpoints.dart';

class NewUserPanel extends StatelessWidget {
  const NewUserPanel({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO ensure responsiveness w/o breakpoints within Responsive
    /// TwoColumnLayout
    return const ResponsiveTwoColumnLayout(
        startFlex: 1,
        endFlex: 2,
        breakpoint: 320,
        spacing: 8,
        startContent: DecoratedBoxWithShadow(
          child: Center(
            child: Text("Link an Existing Bank Account"),
          ),
        ),
        endContent: DecoratedBoxWithShadow(
          child: Center(
            child: Text("Open a New Bank Account"),
          )
        ), 
      );
  }
}