import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:canal/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Landing extends ConsumerWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authProvidersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In / Login"),
      ),
      body: SignInScreen(
        providers: authProvider,
      )
    );
  }
}
