import 'package:canal/features/auth/domain/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// wrapper for the [User] class inside firebase_auth
class FirebaseAppUser implements AppUser {
  const FirebaseAppUser(this._user);
  final User _user;

  @override
  UserID get uid => _user.uid;

  @override
  String? get email => _user.email;

  @override
  bool get emailVerified => _user.emailVerified;

  @override
  Future<void> forceRefreshIdToken() => _user.getIdToken(true);

  @override
  Future<void> sendEmailVerification() => _user.sendEmailVerification();
}

