import 'dart:async';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen_controller.g.dart';

@riverpod
class HomeScreenController extends _$HomeScreenController {
  @override
  FutureOr<void> build() {
    /// no-op nothing to do
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

