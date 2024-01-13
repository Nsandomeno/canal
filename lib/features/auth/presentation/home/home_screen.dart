import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/async_widget.dart';
import 'package:canal/widgets/responsive_scrollable_card.dart';
import 'package:canal/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:canal/widgets/responsive_text.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  /// helpers
  String handleAccountNum(String? actNum) {
    /// retrieve len of bank account number
    if (actNum == null) {
      /// return N/A if an account number has not yet been appended.
      /// * This hopefully should not have to be possible.
      return "N / A";
    }
    final totalChars = actNum.length;
    /// retrieve the len of characters in the bank account number that will be masked (i.e. ****8720)
    final maskLen = totalChars - 4;
    /// create the mask
    final mask = "*" * maskLen;
    /// retrive the actual bank account numbers to display
    final startIdx = (totalChars - 1) - 4; /// 1 to account for 0-based index vals
    final nonMasked = actNum.substring(startIdx);
    return mask + nonMasked;
  }

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
      data: (account) => account != null
        /// TODO create separate widget for user w/ accounts
        ? Scaffold(
          appBar: const UserAppBar(),
          body: ResponsiveScrollableCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ResponsiveText(text: "Accounts".hardcoded, fontColor: Colors.black, fontWeight: FontWeight.bold, fontSize: 24, scaleSize: 1.5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ResponsiveText(text: account.accountSourceName, fontColor: Colors.grey[350], fontWeight: FontWeight.normal, scaleSize: 1.5,),
                    ResponsiveText(text: account.accountType.name.toUpperCase(), fontWeight: FontWeight.normal, scaleSize: 1.5,),
                    ResponsiveText(text: handleAccountNum(account.accountNum), fontColor: Colors.black, fontWeight: FontWeight.normal, scaleSize: 1.5,),                    
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ResponsiveText(text: "Balance".hardcoded, fontColor: Colors.grey[350], fontWeight: FontWeight.normal, scaleSize: 1.5,),
                    ResponsiveText(text: account.balance.toString(), fontColor: Colors.black, fontWeight: FontWeight.normal, scaleSize: 1.5,),                  
                  ],
                ),
              ],
            ),
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
