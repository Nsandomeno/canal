import 'package:canal/constants/breakpoints.dart';
import 'package:canal/constants/sizes.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/action_text_button.dart';
import 'package:canal/widgets/responsive_center.dart';
import 'package:canal/widgets/responsive_scrollable_card.dart';
import 'package:canal/widgets/responsive_two_column_layout.dart';
import 'package:flutter/material.dart';
import 'package:canal/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// error handling
    ref.listen<AsyncValue>(
      homeScreenControllerProvider, (_, state) {
        state.showAlertDialogOnError(context);
    });
    /// controller
    final state = ref.watch(homeScreenControllerProvider);
    /// states with data:
    /// * no accounts
    /// * plaid bank link, no baas account
    /// * baas account, no plaid bank link
    /// * plaid bank link and baas account
    /// 
    return Scaffold(
      appBar: AppBar(
        title: Text("Canal".hardcoded),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(Routes.profile.name),
            icon: const Icon(Icons.person)
          ),
          IconButton(
            onPressed: () => ref.read(homeScreenControllerProvider.notifier).signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Column(
        children: [
          ResponsiveScrollableCard(
            child: Column( 
              children: [
                const Text("Welcome to Canal", style: TextStyle(fontSize: 24),),
                gapH4,
                RichText(
                  maxLines: 6,
                  text: const TextSpan(
                    text: "We are thrilled you're here and think you're experience will come to resemble what you always imagined managing finances should be like.",
                    style: TextStyle(fontSize: 12.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: " Link an existing bank account to get started the fasted."),
                      TextSpan(text: " Or, open a new one through us in minutes."),
                    ]
                  )
                ),
              ],
            )
          ),

          ResponsiveScrollableCard(
            child: Column(
              children: [
                const Card(              
                  elevation: 10,
                  color: Colors.blueGrey,
                  shadowColor: Colors.black,
                  child: ActionTextButton(text: "Link a Bank Account"),
                ),
                gapH16,
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    text: "Link an existing bank account to use it as a source of funds for activities."
                  )
                ),
              ],
            )
          ),

          ResponsiveScrollableCard(
            child: Column(
              children: [
                const Card(
                  elevation: 10,
                  color: Colors.blueGrey,
                  shadowColor: Colors.black,
                  child: ActionTextButton(text: "Open a Bank Account"),
                ),
                gapH16,
                RichText(
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    text: "Open a new bank account with us in minutes."
                  )
                )
              ],
            )
          ),
        ],
      )
    );
  }
}
