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

  // Future<void> updateJob(String uid, String jobId, String title, String company) =>
  //   _firestore.doc("users/$uid/jobs/$jobId").update({
  //     "title": title,
  //     "company": company,
  //   });

  // Future<void> deleteJob(String uid, String jobId) =>
  //   _firestore.doc("users/$uid/jobs/$jobId").delete();

  // Query<Job> jobsQuery(String uid) {
  //   return _firestore.collection("users/$uid/jobs").withConverter(
  //     fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!), 
  //     toFirestore: (job, _) => job.toMap(),
  //   ).orderBy("createdAt", descending: true);
  // }
}

final firestoreRepoProvider = Provider((ref) {
  return FirestoreRepo(FirebaseFirestore.instance);
});
