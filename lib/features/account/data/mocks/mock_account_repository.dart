import 'dart:async';
import 'package:canal/features/account/domain/mock_account.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/account/domain/account.dart';

class MockAccountRepository implements AccountRepository {
  MockAccountRepository({this.addDelay = true});
  final bool addDelay;

  /// pre-load the test accounts
  final _blankAct       = kTestBlankAccount;
  final _plaidLinkedAct = kTestPlaidLinkedAccount;
  final _baasAct        = kTestBaasAccount;


}
