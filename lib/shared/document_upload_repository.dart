import 'package:canal/features/account/domain/document.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
///part 'document_upload_repository.g.dart';
///
/// class for uploading documents to firebase storage
class DocumentUploadRepository {
  DocumentUploadRepository(this._storage);

  final FirebaseStorage _storage;
  /// upload an image asset to firebase storage and return
  /// the download url
  Future<String> uploadDocumentImage(KycDocument doc, ByteData data) async {
    final result = await _uploadDocument(doc.docId, data);
    /// return the download url
    return result.ref.getDownloadURL();
  }

  UploadTask _uploadDocument(String docId, ByteData data) {
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final ref = _storage.ref("documents/$docId");

    return ref.putData(bytes,
      /// TODO do we need this?
      ///SettableMetadata(contentType: "image/png")
    );
  }
}