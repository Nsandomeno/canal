import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// class used to force an ID token refresh on sign in
class UserTokenRefreshService {
  UserTokenRefreshService(this.ref);
  
  final Ref ref;

  void _init() {
    // ref.listen<AsyncValue<AppUser?>>(authStateChanges, (previous, next) {

    // })
  }
}