import 'package:canal/widgets/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProvidersProvider);

    return ProfileScreen(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      providers: authProviders,
    );
  }
}
