import 'package:canal/initialization/bootstrap/bootstrap.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/exceptions/async_error_logger.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/auth/data/mocks/mock_auth_repository.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/account/data/mocks/mock_account_repository.dart';

/// extension methods specific for mock project configuration
extension MockBootstrap on AppBootstrap {
  /// creates the top-level [ProviderContainer] by overriding providers with
  /// fake repositories only. This is useful for testing purposes and for running the app
  /// with a mock backend.
  
  /// Note: all repositories needed by the app can be accessed via providers
  ///       some of these providers throw an [UnimplementedError] by default.
  ///       
  ///       As a result this does thwo things:
  ///       * create and configure the repositories as desired
  ///       * override the default implementations with a list of overrides
  Future<ProviderContainer> createMockProviderContainer({bool addDelay = true}) async {
    final authRepository = MockAuthRepository(addDelay: addDelay);
    final accountRepository = MockAccountRepository(addDelay: addDelay);

    return ProviderContainer(
      overrides: [
        // repositories
        authRepositoryProvider.overrideWithValue(authRepository),
        accountRepositoryProvider.overrideWithValue(accountRepository),
      ],
      observers: [AsyncErrorLogger()],
    );
  }
}