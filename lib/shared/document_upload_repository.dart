///import 'package:canal/features/account/domain/document.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:canal/utils/generate_id.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'document_upload_repository.g.dart';
///
/// class for uploading documents to firebase storage
class DocumentUploadRepository {
  DocumentUploadRepository(this._storage);

  final FirebaseStorage _storage;
  /// upload an image asset to firebase storage and return
  /// the download url
  Future<String> uploadDocument(String userId, String docId, ByteData data) async {
    final result = await _uploadDocument(userId, docId, data);
    /// return the download url
    return result.ref.getDownloadURL();
  }

  UploadTask _uploadDocument(String userUid, String docId, ByteData data) {
    /// UploadTask provides detailed updates
    final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    final ref = _storage.ref("documents/$userUid/$docId");

    return ref.putData(bytes,
      /// TODO do we need this?
      ///SettableMetadata(contentType: "image/png")
    );
  }
}


@riverpod
DocumentUploadRepository documentUploadRepository(DocumentUploadRepositoryRef ref) {
  return DocumentUploadRepository(FirebaseStorage.instance);
}
