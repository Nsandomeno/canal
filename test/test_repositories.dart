import 'package:canal/features/auth/data/mocks/mock_auth_repository.dart';
import 'package:canal/features/auth/data/mocks/mock_user_metadata_repository.dart';
import 'package:mocktail/mocktail.dart';

class TestAuthRepository extends Mock implements MockAuthRepository {}
class TestUserMetadataRepository extends Mock implements MockUserMetadataRepository {}

class Listener<T> extends Mock {
  void call(T? previous, T next);
}
