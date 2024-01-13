import 'package:cloud_firestore/cloud_firestore.dart';
///import 'package:firebase_storage/firebase_storage.dart';
import 'package:equatable/equatable.dart';

enum KycDocType { driversFront, driversBack, passport }
enum KycFileType { png, jpg, pdf }

class KycDocMeta extends Equatable {
  const KycDocMeta({
    required this.name,
    required this.kycDocType,
    required this.fileType,
  });

  final String name;
  final KycDocType kycDocType;
  final KycFileType fileType;

  factory KycDocMeta.fromMap(Map<String, dynamic> map) {
    return KycDocMeta(
      name: map["name"],
      fileType: map["fileType"],
      kycDocType: map["kycDocType"],
    );
  }

  Map<String, dynamic> toMap() => {
    "name": name,
    "fileType": fileType.name,
    "kycDocType": kycDocType.name
  };

  KycDocument toKycDoc(String url, String docId) {
    return KycDocument(
      docId: docId,
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
    required this.docId,
    required this.url,
    required this.name,
    required this.kycDocType,
    required this.fileType,
    this.createdAt,
    this.updatedAt,
  });

  final String docId; // Firestore document ID
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
      docId      : map["docId"] as String,
      name       : map["name"] as String,
      kycDocType : map["kycDocType"] as String,
      fileType   : map["fileType"] as String,
      url        : map["url"] as String,
      createdAt  : createdAt != null ? (createdAt as Timestamp).toDate() : null,
      updatedAt  : updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    "docId"     : docId,
    "name"      : name,
    "kycDocType": kycDocType,
    "fileType"  : fileType,
    "url"       : url, 
    if (createdAt != null) "createdAt": Timestamp.fromDate(createdAt!),
    if (updatedAt != null) "updatedAt": Timestamp.fromDate(updatedAt!),
  };

  @override
  List<Object?> get props => [docId, url, name, kycDocType, fileType];
}