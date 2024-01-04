import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/profile_screen.dart';
import '../features/auth/presentation/sign_in/sign_in_screen.dart';
import '../features/auth/presentation/home/home_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/router/router_refresh_stream.dart';

enum Routes {
  signin,
  home,
  profile,
}

final routerProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(authRepoProvider);

  return GoRouter(
    initialLocation: "/signin",
    debugLogDiagnostics: true,
    refreshListenable: RouterRefreshStream(firebaseAuth.authStateChanges()),
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;

      if (isLoggedIn) {
        if (state.uri.path == "/signin") {
          return "/home";
        }
      } else {
        if (state.uri.path.startsWith("/home")) {
          return "/signin";
        }
      }
      return null;
    },
    routes: [
      GoRoute(
        path: "/signin",
        name: Routes.signin.name,
        builder: (context, state) => const SignIn()
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
