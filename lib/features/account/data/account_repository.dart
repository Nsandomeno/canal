//import 'dart:async';
import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository.g.dart';

class AccountRepository {
  const AccountRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String documentPath(String docId) => "account/$docId";
  static String kycDocCollectionPath(String docId) => "account/$docId/kyc/";

  Future<void> setAccount(
    String userUid,
    Account account,
  ) {
    /// * servers as an upsert
    return _firestore.doc(documentPath(userUid)).set(
      account.toMap(),
      /// use merge: true to keep old fields (if any exist)
      SetOptions(merge: true),
    );
  }

  Future<Account?> fetchAccount(String docId) async {
    final ref = _accountRef(docId);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Future<List<KycDocument?>> fetchDocuments(String parentDocId) async {
    /// TODO may need to do things this way:
    /// * https://firebase.google.com/docs/firestore/query-data/listen
    final ref = _kycDocsRef(parentDocId);
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  Stream<Account?> watchAccount(String docId) {
    final ref = _accountRef(docId);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Stream<List<KycDocument?>> watchDocuments(String parentDocId) {
    /// TODO may need to do things this way:
    /// * https://firebase.google.com/docs/firestore/query-data/listen
    final ref = _kycDocsRef(parentDocId);
    return ref.snapshots().map((snapshot) => 
      snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList()
    );
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
  /// should sub-collections get their own repository / providers?
  Future<void> addKycDoc(String uid, KycDocument userDoc) async {
    return _firestore
      /// TODO the url is currently used as the ID - reconsider this.
      .doc("account/$uid/kyc/${userDoc.url}")
      /// use merge to keep old fields
      .set(userDoc.toMap(), SetOptions(merge: true));
  }   

  DocumentReference<Account> _accountRef(String docId) {
    return _firestore.doc(documentPath(docId)).withConverter(
      fromFirestore: (doc, _) => Account.fromMap(doc.data()!),
      toFirestore: (Account account, options) => account.toMap()
    );
  }

  CollectionReference<KycDocument> _kycDocsRef(String userUid) {
    return _firestore.collection(kycDocCollectionPath(userUid)).withConverter(
      /// TODO find a better way to handle, then the null force operation
      fromFirestore: (doc, _) => KycDocument.fromMap(doc.data()!), 
      toFirestore: (kycDoc, _) => kycDoc.toMap()
    );
  }
}

@Riverpod(keepAlive: true)
AccountRepository accountRepository(AccountRepositoryRef ref) {
  return AccountRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<Account?> accountStream(AccountStreamRef ref, String userUid) {
  final accountRepository = ref.watch(accountRepositoryProvider);

  return accountRepository.watchAccount(userUid);
}

@riverpod
Future<Account?> accountFuture(AccountFutureRef ref, String userUid) {
  final accountRepository = ref.watch(accountRepositoryProvider);

  return accountRepository.fetchAccount(userUid);
}


@riverpod
Stream<List<KycDocument?>> kycDocumentListStream(KycDocumentListStreamRef ref, String userUid) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  
  return accountRepository.watchDocuments(userUid);
}

@riverpod
Future<List<KycDocument?>> kycDocumentListFuture(KycDocumentListFutureRef ref, String userUid) {
  final accountRepository = ref.watch(accountRepositoryProvider);
  return accountRepository.fetchDocuments(userUid);
}
