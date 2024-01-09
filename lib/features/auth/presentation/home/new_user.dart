import 'package:canal/constants/sizes.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/router/router.dart';
import 'package:canal/widgets/responsive_info_panel.dart';
import 'package:canal/widgets/responsive_scrollable_card.dart';
import 'package:canal/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:canal/constants/breakpoints.dart';
import 'package:go_router/go_router.dart';

/// TODO note this file for styling and constant centralization

class NewUserPanel extends StatelessWidget {
  const NewUserPanel({super.key, required this.emailVerified});

  final bool emailVerified;
  
  double responsiveFixedHeightBanner(double screenHeight) {
    if (screenHeight > Breakpoint.desktop) {
      return screenHeight / 5;
    } else if (screenHeight <= Breakpoint.desktop && screenHeight > Breakpoint.tablet) {
      return screenHeight / 5;
    } else if (screenHeight <= Breakpoint.tablet && screenHeight > Breakpoint.mobile) {
      return screenHeight / 10;
    } else {
      return screenHeight / 10;
    } 
  }

  @override
  Widget build(BuildContext context) {
    final String emailVerifiedWarningText = emailVerified ?
      "" : 
      "Please verify your email!".hardcoded;

    var screenSize = MediaQuery.of(context).size.height;
    /// TODO use this snippet as model for enabling / disabling buttons
    var openBankEnabled = false;
    VoidCallback? onPressed() {
      /// TODO replace with the actual function to call onPress
      return openBankEnabled ? () {} : null;
    }

    void goToPlaidLink() {
      // TODO goNamed or pushNamed?
      context.goNamed(Routes.plaid.name);
    }

    void goToBanking() {
      // TODO goNamed or pushNamed?
      context.goNamed(Routes.banking.name);
    }

    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: responsiveFixedHeightBanner(screenSize),
            child: ResponsiveScrollableCard(
              child: Column( 
                children: [
                  const Text("Welcome to Canal", style: TextStyle(fontSize: 24),),
                  gapH4,
                  RichText(
                    maxLines: 6,
                    text: TextSpan(
                      style: const TextStyle(fontSize: 14.0, color: Colors.black),
                      children: <TextSpan>[
                        const TextSpan(text: " Link an existing bank account to get started the fasted."),
                        const TextSpan(text: " Or, open a new one through us in minutes. "),
                        TextSpan(text: emailVerifiedWarningText, style: const TextStyle(fontSize: 14.0, color: Colors.red))
                      ]
                    )
                  ),
                ],
              ),
            ),
          ),
          gapH4,
          ResponsiveInfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Link an Existing Bank Account",
                  style: TextStyle(fontSize: Sizes.p24),
                ),
                gapH8,
                StyledButton(
                  text: "Link Now", 
                  fontColor: Colors.white,
                  onPressed: () => goToPlaidLink(),
                ),
                gapH8,
                RichText(
                  maxLines: 6,
                  text: const TextSpan(
                    style: TextStyle(fontSize: Sizes.p12),
                    text: "Use an existing bank account as a source of funds for activity and let your income history unlock features for you.",
                  )
                )
              ],
            )
          ),
          gapH4,
          ResponsiveInfoCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Open a Bank Account",
                  style: TextStyle(fontSize: Sizes.p24),
                ),
                gapH8,
                StyledButton(
                  text: "Open Now", 
                  fontColor: Colors.white,
                  onPressed: () => goToBanking(),
                ),
                gapH8,
                RichText(
                  maxLines: 6,
                  text: const TextSpan(
                    style: TextStyle(fontSize: Sizes.p12),
                    text: "Open a new bank account through us in minutes. You will be able to issue yourself a debit card too!",
                  )
                )
              ],
            )
          ),
        ],
      );
  }
}