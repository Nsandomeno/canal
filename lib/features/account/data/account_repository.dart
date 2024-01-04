//import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository.g.dart';

class AccountRepository {
  const AccountRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String documentPath(String docId) => "account/$docId";

  Future<Account?> fetchAccount(String docId) async {
    final ref = _accountRef(docId);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Stream<Account?> watchAccount(String docId) {
    final ref = _accountRef(docId);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<void> updateAccount(Account account, String docId) {
    final ref = _accountRef(docId);
    return ref.set(account);
    // TODO return the updated document
  }

  Future<void> deleteAccount(String docId) {
    // TODO add safe-gaurds and return boolean
    return _firestore.doc(documentPath(docId)).delete();
  }

  DocumentReference<Account> _accountRef(String docId) {
    return _firestore.doc(documentPath(docId)).withConverter(
      fromFirestore: (doc, _) => Account.fromMap(doc.data()!),
      toFirestore: (Account account, options) => account.toMap()
    );
  }
}


@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  return AccountRepository(FirebaseFirestore.instance);
}
