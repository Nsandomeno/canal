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

}

