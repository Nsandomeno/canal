import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:canal/exceptions/error_logger.dart';
import 'package:canal/initialization/app.dart';
import 'package:canal/localization/string_hardcoded.dart';

import 'package:canal/features/auth/application/user_token_refresh_service.dart';

/// NOTE: other features could require polling for synchronization,
///       similar to how user_token_refresh_service works

/// helper class to initialize services and configure the error handlers
class AppBootstrap {
  /// create the root widget that should be passed to [runApp]
  Widget createRootWidget({required ProviderContainer container}) {
    /// init UserTokenRefreshService
    container.read(userTokenRefreshServiceProvider);

    /// register error handlers. For more info, see:
    /// https://docs.flutter.dev/testing/errors
    final errorLogger = container.read(errorLoggerProvider);
    registerErrorHandlers(errorLogger);

    return UncontrolledProviderScope(
      container: container, 
      child: const App()
    );
  }

  /// register flutter error handlers
  void registerErrorHandlers(ErrorLogger errorLogger) {
    /// show some error UI if any uncaught exceptions happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      errorLogger.logError(details.exception, details.stack);
    };
    /// handle errors from underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.logError(error, stack);
      return true;
    };
    /// show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("An error occurred".hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }
}

