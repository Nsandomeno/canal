//import 'package:canal/auth_provider.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/shared/firestore_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO define pattern and implement initial loading states
    
    // TODO make provider provide a repository instead of singleton.
    final uid = ref.read(authRepositoryProvider).currentUser!.uid;
    final account = ref.read(firestoreRepoProvider).fetchAccount(uid);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Account'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Link Bank"),
          onPressed: () => print("implement!"),
        ),
      ),
    );
  }
}