import 'package:canal/constants/sizes.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/widgets/action_text_button.dart';
import 'package:canal/widgets/decorated_box.dart';
import 'package:canal/widgets/responsive_two_column_layout.dart';
import 'package:flutter/material.dart';
//import 'package:canal/constants/breakpoints.dart';
class NewUserPanel extends StatelessWidget {
  const NewUserPanel({super.key});

  @override
  Widget build(BuildContext context) {

    return const ResponsiveTwoColumnLayout(
      spacing: 16,
      startContent: Card(
        color: Colors.blueGrey,
        shadowColor: Colors.black,
        child: ActionTextButton(text: "Link a Bank Account"),
      ),
      endContent: Card(
        color: Colors.blueGrey,
        shadowColor: Colors.black,
        child: ActionTextButton(text: "Open a Bank Account",),
      ),
    );
  }
}