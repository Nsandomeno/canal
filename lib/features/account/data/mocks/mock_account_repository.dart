import 'dart:async';
import 'package:canal/features/account/domain/document.dart';
import 'package:canal/features/account/domain/mock_account.dart';
import 'package:canal/features/account/data/account_repository.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:canal/utils/delay.dart';
import 'package:canal/utils/in_memory_store.dart';

class MockAccountRepository implements AccountRepository {
  MockAccountRepository({
    this.addDelay = true, 
    this.mockId = KTestAccountStates.blank
  });
  final bool addDelay;
  final KTestAccountStates mockId;
  /// pre-load the test account:
  // * kTestBlankAccount       (1)
  // * kTestPlaidLinkedAccount (2)
  // * kTestBaasAccount        (3)
  ///
  final InMemoryStore<List<Account>> _accounts = InMemoryStore<List<Account>>(preloadedAccounts);
  /// overrides
  @override
  Future<Account?> fetchAccount(String docId) {
    // docId in the mock repository represents a string representation
    // of a variant of KTestAccountStates
    return Future.value(_getAccount(_accounts.value, docId));
  }

  @override
  Stream<Account?> watchAccount(String docId) {
    // docId in the mock repository represents a string representation
    // of a variant of KTestAccountStates
    return streamAccounts().map((accounts) => _getAccount(accounts, docId));
  }
  @override
  Future<void> addKycDoc(String uid, KycDocument userDoc) async {
    throw UnimplementedError();
  }
  @override
  Future<void> updateAccount(Account account, String docId) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAccount(String docId) {
    throw UnimplementedError();
  }
  /// get account for mocked scenarios
  /// * method only used by mock services, remote data will
  ///   be retrived async
  Account? getAccount(String docId) {
    // docId in the mock repository represents a string representation
    // of a variant of KTestAccountStates
    return _getAccount(_accounts.value, docId);
  }

  static Account? _getAccount(List<Account> accounts, String docId) {
    try {
      final variant = KTestAccountStates.values.firstWhere((element) => element.docId == docId);
      return variant.account;
    } catch (e) {
      return null;
    }
  }
  /// helper for mock scenarios with watchAccount public interface method
  Stream<List<Account>> streamAccounts() {
    return _accounts.stream;
  }

  /// helper for mock scenarios with updateAccount public interface method
  Future<void> setAccount(Account account, String accountId) async {
    await delay(addDelay);

    final accounts = _accounts.value;
    //final variant = KTestAccountStates.values.firstWhere((element) => element.docId == docId);
    final index = accounts.indexWhere((element) => element.accountId == accountId);
    if (index == -1) {
      // if not found, add as new account
      accounts.add(account);
    } else {
      // else, overwrite the previous version
      accounts[index] = account;
    }
    _accounts.value = accounts;
  }
}
