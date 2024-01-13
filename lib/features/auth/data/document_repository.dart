import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


/// repository for the document collection
class DocumentRepository {
  const DocumentRepository(this._firestore);

  final FirebaseFirestore _firestore;

  static String documentPath(String docId) => "document/$docId";

}