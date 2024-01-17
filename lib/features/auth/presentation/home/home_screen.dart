import 'package:canal/constants/sizes.dart';
import 'package:canal/router/router.dart';
import 'package:canal/utils/currency_formatter.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/async_widget.dart';
import 'package:canal/widgets/user_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:canal/widgets/responsive_text.dart';
import 'package:go_router/go_router.dart';

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
    if (user == null) {
      /// TODO what is the proper way to do this?
      ///      need to avoide ref.watch() below
      return const SizedBox.shrink();
    }
    final accountsValue = ref.watch(accountsFutureProvider(user.uid));

    return AsyncValueWidget<List<Account?>>(
      value: accountsValue, 
      data: (accounts) => accounts.isNotEmpty
        /// TODO create separate widget for user w/ accounts
        ? Scaffold(
          appBar: const UserAppBar(),
          body:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ResponsiveText(
                  text: "Accounts".hardcoded, 
                  fontColor: Colors.black, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 24, 
                  scaleSize: 1.5,
                ),
                /// iterate user's accounts
                for (var account in accounts) 
                  Card(  
                    child: Padding(
                      padding: const EdgeInsets.all(8.0), 
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ResponsiveText(
                                text: account?.accountSourceName ?? "Canal", 
                                fontColor: Colors.black, 
                                fontWeight: FontWeight.bold, 
                                scaleSize: .8,
                              ),
                              ResponsiveText(
                                text: account?.accountType?.name.toUpperCase() ?? "Apply Now", 
                                fontWeight: FontWeight.normal,
                                fontColor: Colors.green, 
                                scaleSize: .8,
                              ),                  
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ResponsiveText(
                                text: "Act#: ".hardcoded,
                                fontColor: Colors.grey[350],
                                fontWeight: FontWeight.bold,
                                scaleSize: .8,
                              ),
                              ResponsiveText(
                                text: handleAccountNum(account!.accountNum), 
                                fontColor: Colors.black, 
                                fontWeight: FontWeight.normal, 
                                scaleSize: .8,
                              ),                            
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ResponsiveText(
                                text: fmtDoubleToCurrencyString(account.balance), 
                                fontColor: Colors.black, 
                                fontWeight: FontWeight.bold, 
                                fontSize: 36.0,
                                scaleSize: 1.2,
                              ),  
                              gapW64,             
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ResponsiveText(
                                text: "Active Balance".hardcoded.toUpperCase(),
                                fontColor: Colors.grey[350],
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                scaleSize: 1.2,
                              ),
                              gapW48,
                            ],
                          )
                        ],
                      )
                    ),
                  )
              ],
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
