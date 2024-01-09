import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
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
    final user = ref.watch(authStateChangesProvider).value;
    bool userLoaded() => user != null;
    bool userVerified() => userLoaded() && (user?.emailVerified ?? false);
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
      body: NewUserPanel(emailVerified: userVerified()),
    );
  }
}
