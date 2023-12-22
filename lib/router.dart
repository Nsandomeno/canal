import 'screens/landing.dart';
import 'screens/profile.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/router_refresh_stream.dart';

enum Routes {
  landing,
  profile,
}


final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: "landing",
    debugLogDiagnostics: true,
    redirect: (context, state) {
      return null;
    },
    routes: [
      GoRoute(
        path: "/landing",
        name: Routes.landing.name,
        builder: (context, state) => const Landing()
      ),
      GoRoute(
        path: "/profile",
        name: Routes.profile.name,
        builder: (context, state) => const Profile(),
      )
    ],
  );
});
