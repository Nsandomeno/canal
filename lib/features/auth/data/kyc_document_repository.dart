import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'kyc_document_repository.g.dart';

/// repository for the document collection
class KycDocumentRepository {
  const KycDocumentRepository(this._firestore);

  final FirebaseFirestore _firestore;
  // final String? accountId;
  // final String userUid;

  static String documentsPath() => "document";
  static String documentPath(String id) => "document/$id";

  Future<List<KycDocument?>> fetchKycDocuments(String userUid) async {
    final ref = _kycDocumentQuery(userUid);
    final snapshot = await ref.get();
    return snapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }
  
  Stream<List<KycDocument?>> watchKycDocuments(String userUid) {
    final ref = _kycDocumentQuery(userUid);

    return ref.snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => doc.data()).toList());
  }

  Future<KycDocument?> fetchKycDocument(String docId) async {
    final ref = _kycDocRef(docId);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Stream<KycDocument?> streamKycDocument(String docId){
    final ref = _kycDocRef(docId);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  Future<void> createDocument(
      String userUid,
      String storageUrl,
      KycDocMeta docMeta,
  ) {
    /// TODO error handling and response type
    final kycDoc = docMeta.toKycDoc(storageUrl, userUid);
    return _firestore.doc(documentsPath())
      .set(
        kycDoc.toMap(),
        // use merge: true to keep old fields (if any)
        SetOptions(merge: true)
      );
  }

  Future<void> updateDocument(
    String docId,
    String userUid,
    KycDocMeta docMeta, 
    String storageUrl
  ) {
    /// TODO error handling and response type
    final ref = _kycDocRef(docId);
    return ref.set(docMeta.toKycDoc(storageUrl, userUid));
  }

  Future<void> deleteDocument(String docId) {
    /// TODO error handling and response type
    return _firestore.doc(documentPath(docId)).delete();
  }

  DocumentReference<KycDocument> _kycDocRef(String docId) {
    return _firestore.doc(documentPath(docId)).withConverter(
      fromFirestore: (doc, _) => KycDocument.fromMap(doc.data()!), 
      toFirestore: (KycDocument kycDoc, options) => kycDoc.toMap()
    );
  }

  Query<KycDocument?> _kycDocumentQuery(String userUid) => _firestore
    .collection(documentsPath())
    .where("userUid", isEqualTo: userUid)
    .withConverter(
      fromFirestore: (doc, _) => (doc.data() != null) ? KycDocument.fromMap(doc.data()!) : null, 
      toFirestore: (kycDoc, options) => ( kycDoc != null ) ? kycDoc.toMap() : throw UnsupportedError("handle this and figure out the path to it."),
    );
}

@Riverpod(keepAlive: true)
KycDocumentRepository kycDocumentRepository(KycDocumentRepositoryRef ref) {
  return KycDocumentRepository(FirebaseFirestore.instance);
}

@riverpod
Future<List<KycDocument?>> kycDocumentListFuture(KycDocumentListFutureRef ref, String userUid) {
  final kycDocumentRepository = ref.watch(kycDocumentRepositoryProvider);
  return kycDocumentRepository.fetchKycDocuments(userUid);
}

@riverpod
Future<KycDocument?> kycDocumentFuture(KycDocumentFutureRef ref, String docId) {
  final kycDocumentRepository = ref.watch(kycDocumentRepositoryProvider);
  return kycDocumentRepository.fetchKycDocument(docId);
}

