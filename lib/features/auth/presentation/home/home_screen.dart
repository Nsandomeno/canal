import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/async_widget.dart';
import 'package:canal/widgets/error_message.dart';
import 'package:canal/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/features/account/domain/account.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// error handling
    ref.listen<AsyncValue>(
      homeScreenControllerProvider, (_, state) {
        state.showAlertDialogOnError(context);
    });
    final user = ref.watch(authStateChangesProvider).value;
    /// if the user is not loaded (null),
    /// the router will boot the user back to the signin screen
    bool userLoaded() => user != null;
    bool userVerified() => userLoaded() && (user?.emailVerified ?? false);
    /// controller : note : controller pattern not used here
    /// using AsyncValueWidget pattern which can call
    /// directly from a Repository provider.
    
    /// final state = ref.watch(homeScreenControllerProvider);
    /// due to the router, we can safely use the null override here
    final accountValue = ref.watch(accountFutureProvider(user!.uid));

    return AsyncValueWidget<Account?>(
      value: accountValue, 
      /// TODO this should be checks on account properties
      /// since every use has an account created for them
      /// at registration.
      data: (account) => account != null
        /// TODO create separate widget for user w/ accounts
        ? Scaffold(
          appBar: const UserAppBar(),
          body: Center(
            child: ErrorMessage("COMING SOON".hardcoded),
          ),
        )
        /// TODO create separate widget for brand new user
        : Scaffold(
          appBar: const UserAppBar(),
          /// TODO should probably pass the whole AppUser
          body: NewUserPanel(emailVerified: userVerified()),
        )
    );
  }
}
