import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/profile_screen_controller.dart';
import 'package:canal/router/router.dart';
import 'package:canal/widgets/alert_dialog.dart';
import 'package:canal/widgets/responsive_text.dart';
import 'package:flutter/material.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/styled_button.dart';
import 'package:canal/constants/sizes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final state = ref.watch(profileScreenControllerProvider);
    // TODO should these be extension methods to AppUser or FirebaseAppUser?
    bool userLoaded() => user != null;
    bool userVerified() => userLoaded() && (user?.emailVerified ?? false);

    Future<void> onVerifyEmailPress(BuildContext context) async {
      if (userLoaded() && !userVerified()) {
        final success = await ref
          .read(profileScreenControllerProvider.notifier)
          .sendEmailVerification(user!);
        if (success && context.mounted) {
          showAlertDialog(
            context: context, 
            title: "Sent! Now check your email.",
          );
        }
      } else {
        /// path should not be reachable.
        showAlertDialog(
          context: context, 
          title: "You've already verified this email."
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// email verification row (widget)
            Column(
              children: [
                const Text("Email", style: TextStyle(fontSize: Sizes.p24, color: Colors.black, fontWeight: FontWeight.bold),),
                gapW4,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ResponsiveText(
                      text: user?.email ?? "", 
                      fontWeight: FontWeight.normal,
                      fontColor: Colors.grey,
                      scaleSize: 1.2,
                      ///style: const TextStyle(fontSize: Sizes.p16, color: Colors.grey, fontWeight: FontWeight.normal),
                    ),
                    gapW4,
                    userVerified() ?
                      const Text("Email verified.") :
                      StyledButton(
                          text: "Verify Email",
                          fontColor: Colors.white,
                          onPressed: state.isLoading ? null :
                            () async {
                              return await onVerifyEmailPress(context);
                          },
                      ),
                  ],
                ),
              ],
            ),
            gapH12,
            /// kyc documentation
            Column(
              children: [
                const Text("KYC Documents", style: TextStyle(fontSize: Sizes.p24, color: Colors.black, fontWeight: FontWeight.bold)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("U.S. Driver's License (Front)", style: TextStyle(fontSize: Sizes.p16, color: Colors.grey, fontWeight: FontWeight.bold),),
                    gapW4,
                    StyledButton(
                      text: "Upload",
                      fontColor: Colors.white,
                      onPressed: () => context.goNamed(Routes.documents.name),
                    )
                  ],
                ),
                gapH12,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("U.S. Driver's License (Back) ", style: TextStyle(fontSize: Sizes.p16, color: Colors.grey, fontWeight: FontWeight.bold),),
                    gapW4,
                    StyledButton(
                      text: "Upload",
                      fontColor: Colors.white,
                      onPressed: () => context.goNamed(Routes.documents.name),
                    )
                  ]
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
