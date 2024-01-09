import 'dart:async';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  @override
  FutureOr<void> build() {
    // no-op nothing to do
  }
  /// redundant to HomeScreenController
  Future<bool> sendEmailVerification(AppUser user) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => user.sendEmailVerification());

    return state.hasError == false;
  }
}

