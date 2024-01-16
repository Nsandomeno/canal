import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


/// repository for the document collection
class DocumentRepository {
  const DocumentRepository(this._firestore, {
    required this.accountDocId,
    required this.userUid,
  });

  final FirebaseFirestore _firestore;
  final String accountDocId;
  final String userUid;

  static String documentsPath() => "document";
  static String documentPath(String id) => "document/$id";

  // Future<void> createDocument(
  //     KycDocMeta docMeta,
  // ) {
  //   /// * serves as an upsert
  //   return _firestore.doc(document)
  // }
}