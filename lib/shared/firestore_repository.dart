import 'package:canal/features/auth/domain/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepo {
  const FirestoreRepo(this._firestore);
  final FirebaseFirestore _firestore;


  static String accountsPath() => 'account';
  static String accountPath(String id) => 'account/$id';

  DocumentReference<Account> _accountRef(String uid) {
    return _firestore.doc("account/$uid").withConverter(
      fromFirestore: (doc, _) => Account.fromMap(doc.data()!), 
      toFirestore: (Account account, _) => account.toMap(),
    );
  }

  Future<Account?> fetchAccount(String uid) async {
    final ref = _accountRef(uid);
    final snapshot = await ref.get();
    return snapshot.data();
  }
  // Future<void> addAccount(String uid, String lnUrl, String? currencyIn) async {
  //   // TODO ensure this is sync'd with latest document model (check functions/src/index.js)
  //   final baseCurr = currencyIn ?? "USD";

  //   await _firestore.collection("account/$uid").add({
  //     "lnUrl": lnUrl,
  //     "baseCurrency": baseCurr,
  //     "plaidLink": false,
  //     "baasAccount": false,
  //     "createdAt": FieldValue.serverTimestamp(),
  //     //"updatedAt": FieldValue.serverTimestamp(),
  //   });
  // }

  // Future<void> updateJob(String uid, String jobId, String title, String company) =>
  //   _firestore.doc("users/$uid/jobs/$jobId").update({
  //     "title": title,
  //     "company": company,
  //   });

  // Future<void> deleteJob(String uid, String jobId) =>
  //   _firestore.doc("users/$uid/jobs/$jobId").delete();
}

final firestoreRepoProvider = Provider((ref) {
  return FirestoreRepo(FirebaseFirestore.instance);
});
