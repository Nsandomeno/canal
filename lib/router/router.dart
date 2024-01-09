import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/profile_screen.dart';
import 'package:canal/features/auth/presentation/sign_in/sign_in_form_type.dart';
import '../features/auth/presentation/sign_in/sign_in_screen.dart';
import '../features/auth/presentation/home/home_screen.dart';
import 'package:canal/features/plaid/presentation/plaid_screen.dart';
import 'package:canal/features/banking/presentation/banking_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/router/router_refresh_stream.dart';

enum Routes {
  signin,
  home,
  profile,
  plaid,
  banking,
}

final routerProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(authRepositoryProvider);

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
        builder: (context, state) => const EmailPasswordSignInScreen(
          formType: EmailPasswordSignInFormType.signIn,
        )
      ),
      GoRoute(
        path: "/home",
        name: Routes.home.name,
        builder: (context, state) => const Home(),
        routes: [
          GoRoute(
            path: 'profile',
            name: Routes.profile.name,
            builder: (context, state) => const ProfileScreen(),
          ),
          GoRoute(
            path: "plaid",
            name: Routes.plaid.name,
            builder: (context, state) => const PlaidScreen(),
          ),
          GoRoute(
            path: "banking",
            name: Routes.banking.name,
            builder: (context, state) => const BankingScreen(),
          ),
        ]
      )
    ],
  );
});
