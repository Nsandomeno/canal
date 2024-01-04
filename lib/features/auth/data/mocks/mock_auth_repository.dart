import 'package:canal/exceptions/app_exception.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/domain/app_user.dart';
import 'package:canal/features/auth/domain/mock_app_user.dart';
import 'package:canal/utils/delay.dart';
import 'package:canal/utils/in_memory_store.dart';

class MockAuthRepository implements AuthRepository {
  MockAuthRepository({this.addDelay = true});

  final bool addDelay;
  final _authState = InMemoryStore<AppUser?>(null);
  /// list to keep track of all user accounts [ likely un-needed ]
  final List<MockAppUser> _users = [];

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  Stream<AppUser?> idTokenChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> signOut() async {
    _authState.value = null;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);

    // check for the given credentials against each registered user
    for (final u in _users) {
      // matching email and password
      if (u.email == email && u.password == password) {
        _authState.value = u;
        return;
      }
      // same email, wrong password
      if (u.email == email && u.password != password) {
        throw WrongPasswordException();
      }
    }
    throw UserNotFoundException();
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);
    // check if the email is already in-use
    for (final u in _users) {
      if (u.email == email) {
        throw EmailAlreadyInUseException();
      }
    }
    // min password length requirement
    if (password.length < 8) {
      throw WeakPasswordException();
    }
    // create new user
    _createNewUser(email, password);
  }

  void _createNewUser(String email, String password) {
    // create new user
    final user = MockAppUser(
      uid: email.split("").reversed.join(), 
      email: email, 
      password: password
    );
    // register it
    _users.add(user);
    // update the auth state
    _authState.value = user;
  }

}