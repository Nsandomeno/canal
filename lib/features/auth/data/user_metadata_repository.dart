import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mocks/user_metadata_repository.g.dart';

/// helper repository class to watch the user metadata in Firestore
/// TODO setup mock and tests
class UserMetadataRepository {
  const UserMetadataRepository(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<DateTime?> watchUserMetadata(UserID uid) {
    final ref = _firestore.doc("metadata/$uid");
    return ref.snapshots().map((snapshot) {
      final data = snapshot.data();
      final refreshTime = data?["refreshTime"];
      if (refreshTime is Timestamp) {
        return refreshTime.toDate();
      } else {
        return null;
      }
    });
  }
}


@Riverpod(keepAlive: true)
UserMetadataRepository userMetadataRepository(UserMetadataRepositoryRef ref) {
  return UserMetadataRepository(FirebaseFirestore.instance);
}

@Riverpod(keepAlive: true)
Stream<DateTime?> userMetadataRefreshTime(UserMetadataRefreshTimeRef ref, UserID uid) {
  return ref.watch(userMetadataRepositoryProvider).watchUserMetadata(uid);
}
