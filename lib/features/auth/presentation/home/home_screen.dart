import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/new_user.dart';
import 'package:flutter/material.dart';
import 'package:canal/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// TODO need auth repo
    final auth = ref.read(authRepositoryProvider);
    /// TODO need account repo
    /// states:
    /// * no accounts
    /// * plaid bank link, no baas account
    /// * baas account, no plaid bank link
    /// * plaid bank link and baas account
    /// 
    /// TODO toggle new_user and dashboard
    ///      depending on what state the user
    ///      belongs to.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(Routes.profile.name),
            icon: const Icon(Icons.person)
          ),
          IconButton(
            onPressed: () => auth.signOut(),
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const NewUserPanel()
    );
  }
}
