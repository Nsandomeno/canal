import 'package:canal/screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/landing.dart';
import 'screens/home.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/router_refresh_stream.dart';

enum Routes {
  landing,
  home,
  profile,
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  // TODO convert to repo model
  return FirebaseAuth.instance;
});

final routerProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return GoRouter(
    initialLocation: "/landing",
    debugLogDiagnostics: true,
    refreshListenable: RouterRefreshStream(firebaseAuth.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;

      if (isLoggedIn) {
        if (state.uri.path == "/landing") {
          return "/home";
        }
      } else {
        if (state.uri.path.startsWith("/home")) {
          return "/landing";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: "/landing",
        name: Routes.landing.name,
        builder: (context, state) => const Landing()
      ),
      GoRoute(
        path: "/home",
        name: Routes.home.name,
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: 'profile',
            name: Routes.profile.name,
            builder: (context, state) => const Profile(),
          ),
        ]
      )
    ],
  );
});
