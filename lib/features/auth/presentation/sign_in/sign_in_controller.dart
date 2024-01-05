import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/presentation/sign_in/sign_in_form_type.dart';

part 'sign_in_controller.g.dart';

@riverpod
class EmailPasswordSginInController extends _$EmailPasswordSginInController {
  @override
  FutureOr<void> build() {
    /// no-op nothing to do
  }

  Future<bool> submit({
    required String email,
    required String password,
    required EmailPasswordSignInFormType formType,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() => _authenticate(email, password, formType));

    return state.hasError == false;
  }

  Future<void> _authenticate(String email, String password, EmailPasswordSignInFormType formType) {
    final authRepository = ref.read(authRepositoryProvider);

    switch (formType) {
      case EmailPasswordSignInFormType.signIn:
        return authRepository.signInWithEmailAndPassword(email, password);
      case EmailPasswordSignInFormType.register:
        return authRepository.createUserWithEmailAndPassword(email, password);
    }
  }
}

