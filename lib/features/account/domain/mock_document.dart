import 'package:canal/features/account/domain/document.dart';
import 'package:canal/utils/generate_id.dart';
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
  String? kycDocType,
  String? fileType
  ) async {
    /// handle optional params
    final checkedKycDocType = kycDocType ?? 
      "drivers-license";
    final checkedFileType = fileType ??
      "png";
    /// sample asset path
    const path = "assets/documents/test-drivers-front.png";
    ///final byteData = await rootBundle.load(path);
    return KycDocument(
      docId: newUuidV4(),
      url: path, 
      name: "test-document-from-assets", 
      kycDocType: checkedKycDocType, 
      fileType: checkedFileType,
    );
}
