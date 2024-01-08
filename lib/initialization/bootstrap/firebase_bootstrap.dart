
import 'package:canal/features/auth/data/mocks/mock_user_metadata_repository.dart';
import 'package:canal/features/auth/data/user_metadata_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canal/initialization/bootstrap/bootstrap.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/exceptions/async_error_logger.dart';
/// NOTE: 
///     * no overrides for this bootstrap code
/// 
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/data/mocks/mock_auth_repository.dart';
// import 'package:canal/features/account/data/account_repository.dart';
// import 'package:canal/features/account/data/mocks/mock_account_repository.dart';

/// extension methods specific for the firebase project configuration
extension FirebaseBootstrap on AppBootstrap {
  /// creates the top-level [ProviderContainer] by overriding providers
  
  /// TODO make these overrides configurable by an environment variable or
  ///      some other constant if that is the only way to do it without rebuilding.
  
  /// NOTE: no overrides to add at this stage.
  Future<ProviderContainer> createFirebaseProviderContainer({bool addDelay = true}) async {
    /// NOTE: no overrides at this stage.
    ///final authRepository = MockAuthRepository(addDelay: addDelay);
    /// extending the default fake expiry (in seconds)
    ///final userMetadataRepository = MockUserMetadataRepository(addDelay: true, expiresInSecs: 120);
    return ProviderContainer(
      overrides: [
        ///authRepositoryProvider.overrideWithValue(authRepository),
        ///userMetadataRepositoryProvider.overrideWithValue(userMetadataRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
  }

  Future<void> setupEmulators() async {
    await FirebaseAuth.instance.useAuthEmulator("localhost", 9099);
    FirebaseFirestore.instance.useFirestoreEmulator("localhost", 8080);
    /// When running on the emulator, disable persistence to avoid discrepencies
    /// between the emulated database and local caches. More info here:
    /// * https://firebase.google.com/docs/emulator-suite/connect_firestore#instrument_your_app_to_talk_to_the_emulators
    FirebaseFirestore.instance.settings = const Settings(
      persistenceEnabled: false
    );
  }
}

