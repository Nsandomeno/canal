import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
/// TODO - important UX additons:
/// * try to find a less jumpy transition when clicking buttons that route to new screens
///   or clicking the back button. I anticipate that the way to achieve
///   this will be setting an attribute on [MaterialApp.router] related to
///   transitions
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: true,
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => "Canal".hardcoded,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.grey,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white,
          elevation: 5,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white
          )
        )
      ),
    );
  }
}