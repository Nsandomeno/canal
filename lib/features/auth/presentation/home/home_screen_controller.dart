import 'dart:async';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:canal/router/router.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<void> build() {
    /// no-op nothing to do
  }
  /// consider calling context directly from the screen / sub-widget
  void goToPlaidScreen(BuildContext context) {
    context.goNamed(Routes.plaid.name);
  }
  /// consider calling context directly from the screen / sub-widget
  void goToBankingScreen(BuildContext context) {
    context.goNamed(Routes.banking.name);
  }

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

