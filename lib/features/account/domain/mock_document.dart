import 'package:canal/utils/generate_id.dart';
import 'package:canal/features/account/domain/document.dart';
/// returns test or demo KYC documents to use
/// this uses one sample document loaded in the 
/// asset bundles and returns a KycDocument
/// with configurable:
/// * name
/// * fileType
/// * kycDocType
/// 
/// there will be one path in the urls list
/// referring to the location in the asset bundle.
Future<KycDocument> kTestDocument(
  KycDocType? kycDocType,
  KycFileType? fileType,
  String? userUid,
  String? accountDocId,
  ) async {
    /// handle optional params
    final checkedKycDocType = kycDocType ?? 
      KycDocType.driversFront;
    final checkedFileType = fileType ??
      KycFileType.jpg;
    final accountId = accountDocId ?? newUuidV4();
    final userId = userUid ?? "1";
    /// sample asset path
    const path = "assets/documents/test-drivers-front.png";
    ///final byteData = await rootBundle.load(path);
    return KycDocument(
      userUid: userId,
      accountDocId: accountId,
      url: path, 
      name: "test-document-from-assets", 
      kycDocType: checkedKycDocType.name, 
      fileType: checkedFileType.name,
    );
}
