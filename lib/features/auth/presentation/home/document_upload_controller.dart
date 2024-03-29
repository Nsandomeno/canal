import 'package:canal/features/account/domain/document.dart';
import 'package:canal/features/auth/application/kyc_service.dart';
import 'package:canal/features/auth/data/image_repository.dart';
import 'package:canal/router/router.dart';
import 'package:canal/utils/notifier_mounted.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/services.dart';

part 'document_upload_controller.g.dart';

@riverpod
class DocumentUploadController extends _$DocumentUploadController
  with NotifierMounted {

  @override
  FutureOr<void> build() {
    ref.onDispose(setUnmounted);
  }
  /// TODO ensure AsyncData is working with the return type
  Future<XFile?> loadFile() async {
    try {
      state = const AsyncLoading();
      final result = await ref.read(imageRepositoryProvider).selectOne();

      if (mounted) {
        /// SET SUCCESS TODO - handle properly
        state = const AsyncData(null);
      }
    } catch (e, stackTrace) {
      if (mounted) {
        /// SET ERROR TODO - handle properly
        state = AsyncError(e, stackTrace);
      }
    }
  }
  /// TODO ensure AsyncData is working with the return type
  Future<XFile?> createFile() async {
    try {
      state = const AsyncLoading();
      final result = await ref.read(imageRepositoryProvider).takeOne();

      if (mounted) {
        /// SET SUCCESS TODO - handle properly
        state = const AsyncData(null);
      }
    } catch (e, stackTrace) {
      if (mounted) {
        /// SET ERROR TODO - handle properly
        state = AsyncError(e, stackTrace);
      }
    }
  }

  Future<void> upload(KycDocMeta docMeta, ByteData data) async {
    try {
      state = const AsyncLoading();
      /// upload to bytes to storage, get url, use to store
      /// record of the document in sub-collection of the account collection
      await ref.read(kycServiceProvider).uploadKycDocument(docMeta, data);
      /// set state, if still mounted and not routing away
      if (mounted) {
        /// SET SUCCESS TODO - handle properly
        state = const AsyncData(null);
      }
      /// route to account overview page
      // ref.read(routerProvider).goNamed(
      //   Routes.account.name,
      //   params: {"id": accountId}
      // );
    } catch (e, stackTrace) {
      if (mounted) {
        /// SET ERROR TODO - handle properly
        state = AsyncError(e, stackTrace);
      }
      
    }
  }
}