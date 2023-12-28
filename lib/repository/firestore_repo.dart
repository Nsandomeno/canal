import 'package:canal/repository/account.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirestoreRepo {

  FirestoreRepo(this._firestore);

  final FirebaseFirestore _firestore;

  Future<void> addAccount(String uid, String lnUrl, String? currencyIn) async {
    final baseCurr = currencyIn ?? "USD";

    await _firestore.collection("account").add({
      "uid": uid,
      "lnUrl": lnUrl,
      "baseCurrency": baseCurr,
      "plaidStatus": false,
      "plaidCurrency": baseCurr,
      "createdAt": FieldValue.serverTimestamp(),
      "updatedAt": FieldValue.serverTimestamp(),
    });
  }
  
  Query<Account> accountQuery(String uid) {
    return _firestore.collection("account/$uid").withConverter(
      fromFirestore: (snapshot, _) => Account.fromMap(snapshot.data()!), 
      toFirestore: (account, _) => account.toMap(),
    ).orderBy("createdAt", descending: true);
  }
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
