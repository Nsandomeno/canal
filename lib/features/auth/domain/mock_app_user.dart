import 'package:canal/features/auth/domain/app_user.dart';

/// mock user class used to simulate a user account on the backend.
/// * This class is implementation-specific and should only be used by the
/// * [MockAuthRepository], so it should not belong to the domain layer
class MockAppUser extends AppUser {
  const MockAppUser({
    required super.uid,
    required super.email,
    required this.password, // extension
  });

  final String password; // extension
}

