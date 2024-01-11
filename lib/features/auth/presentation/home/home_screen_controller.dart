import 'dart:async';
import 'dart:ffi';
import 'package:canal/exceptions/error_logger.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:canal/router/router.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

// class HomeScreenData {
//   HomeScreenData({this.user, this.account});

//   final AppUser? user;
//   final Account? account;

//   AppUser? get getUser {
//     return user;
//   }

//   Account? get getAccount {
//     return account;
//   }

//   bool hasUser() => user != null;
//   bool hasAccount() => account?.baasAccount != null || 
//     account?.plaidLink != null;
// }

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<void> build() {
    /// no-op nothing to do
  }
  /// consider calling context directly from the screen / sub-widget
  void goToPlaidScreen() {
    ref.watch(routerProvider).goNamed(Routes.plaid.name);
  }
  /// consider calling context directly from the screen / sub-widget
  void goToBankingScreen() {
    ref.watch(routerProvider).goNamed(Routes.banking.name);
  }

  // void displayDashboard() {
  //   final user = ref.read(authRepositoryProvider).currentUser;
  //   if (user == null) {
  //     /// TODO handle this case... something went wrong screen pop
  //     debugPrint("TODO handle the case of a user's auth vanishing... pop a something went wrong screen.");
  //   }

  //   final account = ref.read(accountFutureProvider(user!.uid));
  // }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();

    state = await AsyncValue.guard(() => authRepository.signOut());
  }

  Future<bool> sendEmailVerification(AppUser user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => user.sendEmailVerification());

    return state.hasError == false;
  }
}

