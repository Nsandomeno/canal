import 'package:canal/exceptions/app_exception.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
///import 'package:canal/features/account/domain/account.dart';
import 'package:canal/utils/generate_id.dart';
import 'package:canal/features/account/domain/document.dart';
import 'package:canal/shared/document_upload_repository.dart';
import 'package:canal/features/auth/data/auth_repository.dart';
import 'package:canal/features/account/data/account_repository.dart';

part 'kyc_service.g.dart';

class KycService {
  const KycService(this.ref);
  final Ref ref;

  Future<void> uploadKycDocument(KycDocMeta docMeta, ByteData data) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    final docId = newUuidV4();
    /// check for unusual loss of auth creds
    if (user == null) {
      throw UserNotFoundException();
    }
    /// upload to storage and get url
    final url = await ref
      .read(documentUploadRepositoryProvider)
      .uploadDocument(user.uid, docId, data);
    /// convert doc metadata to a kyc sub-collection document
    final KycDocument kycDoc = docMeta.toKycDoc(url, docId);
    /// upload the document's record to firestore 
    await ref
      .read(accountRepositoryProvider)
      .addKycDoc(user.uid, kycDoc);
  }
}

@riverpod
KycService kycService(KycServiceRef ref) {
  return KycService(ref);
}
