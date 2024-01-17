import 'package:cloud_firestore/cloud_firestore.dart';
///import 'package:firebase_storage/firebase_storage.dart';
import 'package:equatable/equatable.dart';

enum KycDocCategory {
  /// * NOTE this is a frontend only enum and is not included in the database 
  drivers,
  passport;

  static List<String> dropDownOpts() {
    return KycDocCategory.values.map((KycDocCategory variant) => switch (variant) {
      drivers => "Driver's License",
      passport => "Passport",
      _ => throw UnimplementedError("Add new KycDocCategory variant to its dropDownOpts method."),
    }).toList();
  }

  static List<KycDocCategory> getKycDocCategories() {
    return KycDocType.values.map((KycDocType variant) => switch (variant) {
      KycDocType.driversFront => KycDocCategory.drivers,
      KycDocType.driversBack => KycDocCategory.drivers,
      KycDocType.passport => KycDocCategory.passport,
      _ => throw UnimplementedError("Add new KycDocType variant to the frontend enum KycDocCategory."),
    }).toList();
  }

  static List<KycDocType> getKycDocCategoryRequirements(KycDocCategory variant) {
    return KycDocType.values.where((vari) => KycDocType.getCategory(vari) == variant).toList();
  }

}

enum KycDocType { 
  driversFront, 
  driversBack, 
  passport;

  static List<String> dropDownOpts() {
    return KycDocType.values.map((KycDocType variant) => switch (variant) {
      driversFront => "Driver's License (Front)",
      driversBack => "Driver's License (Back)",
      passport => "Passport",
    }).toList();
  }

  static KycDocType displayTextToVariant(String s) => switch (s) {
    "Driver's License (Front)" => driversFront,
    "Driver's License (Back)" => driversBack,
    "Passport" => passport,
    _ => throw UnimplementedError("Apply error handling around this call.")
  };

  static KycDocCategory getCategory(KycDocType variant) => switch (variant) {
    driversFront => KycDocCategory.drivers,
    driversBack => KycDocCategory.drivers,
    passport => KycDocCategory.passport
  };

}


enum KycFileType { 
  png, 
  jpg, 
  pdf; 
}


class KycDocMeta extends Equatable {
  const KycDocMeta({
    required this.name,
    required this.kycDocType,
    required this.fileType,
    this.accountId,
  });

  final String name;
  final String? accountId;
  final KycDocType kycDocType;
  final KycFileType fileType;

  factory KycDocMeta.fromMap(Map<String, dynamic> map) {
    return KycDocMeta(
      name: map["name"],
      accountId: map["accountId"],
      fileType: map["fileType"],
      kycDocType: map["kycDocType"],
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "accountId": accountId,
    "fileType": fileType.name,
    "kycDocType": kycDocType.name,
  };

  KycDocument toKycDoc(String url, String userUid) {
    return KycDocument(
      userUid: userUid,
      accountId: accountId,
      url: url, 
      name: name, 
      kycDocType: kycDocType.name, 
      fileType: fileType.name
    );
  }

  @override
  List<Object?> get props => [name, fileType, kycDocType];
}

class KycDocument extends Equatable {
  const KycDocument({
    required this.userUid,
    this.accountId,
    required this.url,
    required this.name,
    required this.kycDocType,
    required this.fileType,
    this.createdAt,
    this.updatedAt,
  });

  final String? accountId;
  final String userUid;
  final String name;
  final String url; 
  final String kycDocType;
  final String fileType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory KycDocument.fromMap(Map<String, dynamic> map) {
    final createdAt = map["createdAt"];
    final updatedAt = map["updatedAt"];
    return KycDocument(
      accountId    : map["accountId"] as String?,
      userUid      : map["userUid"] as String,
      name         : map["name"] as String,
      kycDocType   : map["kycDocType"] as String,
      fileType     : map["fileType"] as String,
      url          : map["url"] as String,
      createdAt    : createdAt != null ? (createdAt as Timestamp).toDate() : null,
      updatedAt    : updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    "accountId"    : accountId,
    "userUid"      : userUid,
    "name"         : name,
    "kycDocType"   : kycDocType,
    "fileType"     : fileType,
    "url"          : url, 
    if (createdAt != null) "createdAt": Timestamp.fromDate(createdAt!),
    if (updatedAt != null) "updatedAt": Timestamp.fromDate(updatedAt!),
  };

  @override
  List<Object?> get props => [
    userUid, 
    accountId, 
    url, 
    name, 
    kycDocType, 
    fileType
  ];
}