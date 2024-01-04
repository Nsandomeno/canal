import 'dart:async';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:canal/features/auth/domain/firebase_app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthRepository {
  AuthRepository(this._auth);

  final FirebaseAuth _auth;

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() {
    return _auth.signOut();
  }

  Stream<AppUser?> authStateChanges() {
    return _auth.authStateChanges().map(_convertUser);
  }

  /// notifies about changes to the user's sign-in state
  /// and token refresh events
  Stream<AppUser?> idTokenChanges() {
    return _auth.idTokenChanges().map(_convertUser);
  }

  AppUser? get currentUser => _convertUser(_auth.currentUser);

  /// helper method to convert [User] to an [AppUser]
  AppUser? _convertUser(User? user) =>
    user != null ? FirebaseAppUser(user) : null;
  
}


final authRepoProvider = Provider((ref) {
  return AuthRepository(FirebaseAuth.instance);
});


final authStateChanges = StreamProvider((ref) {
  final authRepository = ref.watch(authRepoProvider);

  return authRepository.authStateChanges();
});

