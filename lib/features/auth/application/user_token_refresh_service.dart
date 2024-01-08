import 'dart:async';

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
  StreamSubscription<DateTime?>? _subscription;
  /// cleanup
  void dispose() {
    _subscription?.cancel();
  }

  void _init() {
    ref.listen<AsyncValue<AppUser?>>(authStateChangesProvider, (previous, next) {
      final user = next.value;
      /// if a previous subscription was active, dispose it
      _subscription?.cancel();
      if (user != null) {
        /// on sign in, listen to metadata updates
        /// * and register a subscription
        _subscription = ref
          .read(userMetadataRepositoryProvider)
          .watchUserMetadata(user.uid)
          .listen((refreshTime) async {
            /// read user again as it may be null by the time we reach this callback
            final user = ref.read(authRepositoryProvider).currentUser;
            if (refreshTime != null && user != null) {
              debugPrint("Force token refresh: $refreshTime, uid:${user.uid}");
              /// * force an ID token refresh, which will cause a new stream of event
              /// * to be emitted by [ `idTokenChanges` ]
              await user.forceRefreshIdToken();
            }
        });
      }
    });
  }
}

@Riverpod(keepAlive: true)
UserTokenRefreshService userTokenRefreshService(UserTokenRefreshServiceRef ref) {
  final service = UserTokenRefreshService(ref);
  ref.onDispose(service.dispose);

  return service;
}
