import 'package:canal/constants/breakpoints.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/home/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/router/router.dart';
import 'package:canal/features/auth/domain/app_user.dart';

class UserAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const UserAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    /// * This widget is responsive.
    /// * On large screen sizes, it shows all the actions in the app bar.
    /// * On small screen sizes, it shows only the shopping cart icon and an [AppBarMenu]
    /// 
    /// ! MediaQuery is used on the assumption that the widget takes up the full
    /// ! width of the screen. If that's not the case, LayoutBuilder should be
    /// ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < Breakpoint.tablet) {
      /// mobile
      return AppBar(
        title: Text("Canal".hardcoded),
        actions: [
          AppBarMenu(user: user),
          IconButton(
            onPressed: () {
              ref.read(homeScreenControllerProvider.notifier).signOut();
            }, 
            icon: const Icon(Icons.logout),
          )         
        ],
      );
    } else {
      /// default implementation
      return AppBar(
        title: Text("Canal".hardcoded),
        actions: [
          IconButton(
            onPressed: () => context.goNamed(Routes.profile.name), 
            icon: const Icon(Icons.person)
          ),
          IconButton(
            onPressed: () {
              ref.read(homeScreenControllerProvider.notifier).signOut();
            }, 
            icon: const Icon(Icons.logout)
          )
        ],
      );
    }
  }
}


enum MenuRoutes {
  ///signOut,
  profile,
  home,
  signIn,
}


class AppBarMenu extends StatelessWidget {
  const AppBarMenu({super.key, this.user});

  final AppUser? user;
  /// * keys for testing (find.byKey())
  static const signInKey  = Key("menuSignIn");
  static const signOutKey = Key("menuSignOut");
  static const profileKey = Key("menuProfile");
  static const homeKey    = Key("menuHomeKey");

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      /// three vertical dots icon (to reveal the menu)
      icon: const Icon(Icons.more_vert),
      itemBuilder: (_) {
        /// show all the options based on conditional logic
        return <PopupMenuEntry<MenuRoutes>>[
          if (user != null) ...[
            PopupMenuItem(key: homeKey, value: MenuRoutes.home, child: Text("Home".hardcoded)),
            PopupMenuItem(key: profileKey, value: MenuRoutes.profile, child: Text("Profile".hardcoded)),
            ///PopupMenuItem(key: signOutKey, value: MenuRoutes.signOut, child: Text("Sign Out".hardcoded)),
          ] else 
            PopupMenuItem(key: signInKey, value: MenuRoutes.signIn, child: Text("Sign In".hardcoded)),  
        ];
      },
      onSelected: (option) => {
        /// push to different routes based on selected option
        switch (option) {
          MenuRoutes.signIn =>
            context.pushNamed(Routes.signin.name),
          MenuRoutes.home =>
            context.pushNamed(Routes.home.name),
          MenuRoutes.profile =>
            context.pushNamed(Routes.profile.name),
        }
      },
    );
  }
}