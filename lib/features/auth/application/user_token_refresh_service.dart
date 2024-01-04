import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/data/user_metadata_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';

part 'user_token_refresh_service.g.dart';
/// class used to force an ID token refresh on sign in
class UserTokenRefreshService {
  UserTokenRefreshService(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<AppUser?>>(authStateChangesProvider, (previous, next) {
      final user = next.value;
      if (user != null) {
        /// on sign in, listen to metadata updates
        ref.listen<AsyncValue<DateTime?>>(userMetadataRefreshTimeProvider(user.uid), (previous, next) async {
          final refreshTime = next.value;
          /// read user again as it may be null by the time we reach this callback
          final user = ref.read(authRepositoryProvider).currentUser;
          if (refreshTime != null && user != null) {
            debugPrint("Force refresh token: $refreshTime, uid:${user.uid}");
            /// force an ID token refresh, which will cause a new stream event
            /// to be emitted by [idTokenChanges]
            await user.forceRefreshIdToken();
          }
        });
      }
    });
  }
}

@Riverpod(keepAlive: true)
UserTokenRefreshService userTokenRefreshService(UserTokenRefreshServiceRef ref) {
  return UserTokenRefreshService(ref);
}
