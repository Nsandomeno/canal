import 'package:canal/features/auth/data/user_metadata_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:canal/utils/in_memory_store.dart';

class MockUserMetadataRepository implements UserMetadataRepository {
  MockUserMetadataRepository({
    this.addDelay = true,
    this.expiresInSecs = 10,
    this.setUnexpiredRefreshToken = true,
    });

  final bool addDelay;
  final int expiresInSecs;
  final bool setUnexpiredRefreshToken;
  late DateTime? refreshTime = setUnexpiredRefreshToken ? 
    DateTime.now().add(Duration(seconds: expiresInSecs)) :
    null;
  /// using a refreshTime that is about to expire in 10 seconds, or custom
  late InMemoryStore<DateTime?> metaDoc = InMemoryStore(refreshTime);

  /// override interface
  @override
  Stream<DateTime?> watchUserMetadata(UserID uid) {
    return streamRefreshTime();
  }

  /// helpers for mock scenarios with watchUserMetadata
  Stream<DateTime?> streamRefreshTime() {
    return metaDoc.stream;
  }
}