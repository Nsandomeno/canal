import 'package:flutter/material.dart';
import 'package:canal/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(Routes.profile.name),
            icon: const Icon(Icons.person)
          )
        ],
      ),
      body: const Center(
        child: Text("Coming Soon..."),
      ),
    );
  }
}
