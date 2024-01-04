import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:canal/widgets/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignIn extends ConsumerWidget {
  const SignIn({super.key});

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
