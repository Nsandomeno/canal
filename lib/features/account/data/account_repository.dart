//import 'dart:async';
import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:canal/features/account/domain/account.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_repository.g.dart';

class AccountRepository {
  const AccountRepository(this._firestore);

  final FirebaseFirestore _firestore;
  /// TODO
  /// * refactor methods where docId is random and userId is a field on 
  ///   the document
  static String accountsPath() => "account";
  static String accountPath(String docId) => "account/$docId";
  // static String kycDocCollectionPath(String docId) => "account/$docId/kyc/";

  Future<void> createAccount(Account account) {
    /// * create initial account
    return _firestore.collection(accountsPath()).add(
      account.toMap()
    ).then((DocumentReference doc) {
      /// TODO handle document create
      print('Document snapshot added with ID: ${doc.id}');
    });
  }

  Future<List<Account?>> fetchAccounts(String userUid) async {
    final ref = _accountsQuery(userUid);
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  // Future<List<KycDocument?>> fetchDocuments(String userUid) async {
  //   /// TODO may need to do things this way:
  //   /// * https://firebase.google.com/docs/firestore/query-data/listen
  //   final ref = _kycDocsRef(parentDocId);
  //   final snapshot = await ref.get();
  //   return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  // }

  Stream<Account?> watchAccount(String docId) {
    final ref = _accountRef(docId);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  // Stream<List<KycDocument?>> watchDocuments(String parentDocId) {
  //   /// TODO may need to do things this way:
  //   /// * https://firebase.google.com/docs/firestore/query-data/listen
  //   final ref = _kycDocsRef(parentDocId);
  //   return ref.snapshots().map((snapshot) => 
  //     snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList()
  //   );
  // }

  Future<void> updateAccount(Account account, String docId) {
    final ref = _accountRef(docId);
    return ref.set(account);
    // TODO return the updated document
  }

  Future<void> deleteAccount(String docId) {
    // TODO add safe-gaurds and return boolean
    return _firestore.doc(accountPath(docId)).delete();
  }
  /// should sub-collections get their own repository / providers?
  // Future<void> addKycDoc(String uid, KycDocument userDoc) async {
  //   return _firestore
  //     /// TODO the url is currently used as the ID - reconsider this.
  //     .doc("account/$uid/kyc/${userDoc.url}")
  //     /// use merge to keep old fields
  //     .set(userDoc.toMap(), SetOptions(merge: true));
  // }   

  DocumentReference<Account> _accountRef(String docId) {
    return _firestore.doc(accountPath(docId)).withConverter(
      fromFirestore: (doc, _) => Account.fromMap(doc.data()!),
      toFirestore: (Account account, options) => account.toMap()
    );
  }

  Query<Account?> _accountsQuery(String userUid) {
    return _firestore.collection(accountsPath())
      .where("userUid", isEqualTo: userUid)
      .withConverter(
        fromFirestore: (snapshot, _) => ( snapshot.data() != null ) ? Account.fromMap(snapshot.data()!) : null, 
        toFirestore: (account, _) => ( account != null ) ? account.toMap() : throw UnsupportedError("handle this better."),
    );
  }

  // CollectionReference<KycDocument> _kycDocsRef(String userUid) {
  //   return _firestore.collection(kycDocCollectionPath(userUid)).withConverter(
  //     /// TODO find a better way to handle, then the null force operation
  //     fromFirestore: (doc, _) => KycDocument.fromMap(doc.data()!), 
  //     toFirestore: (kycDoc, _) => kycDoc.toMap()
  //   );
  // }
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
Future<List<Account?>> accountsFuture(AccountsFutureRef ref, String userUid) {
  final accountRepository = ref.watch(accountRepositoryProvider);

  return accountRepository.fetchAccounts(userUid);
}


// @riverpod
// Stream<List<KycDocument?>> kycDocumentListStream(KycDocumentListStreamRef ref, String userUid) {
//   final accountRepository = ref.watch(accountRepositoryProvider);
  
//   return accountRepository.watchDocuments(userUid);
// }

// @riverpod
// Future<List<KycDocument?>> kycDocumentListFuture(KycDocumentListFutureRef ref, String userUid) {
//   final accountRepository = ref.watch(accountRepositoryProvider);
//   return accountRepository.fetchDocuments(userUid);
// }
