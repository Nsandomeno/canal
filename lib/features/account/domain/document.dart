import 'package:cloud_firestore/cloud_firestore.dart';
///import 'package:firebase_storage/firebase_storage.dart';
import 'package:equatable/equatable.dart';

class KycDocument extends Equatable {
  const KycDocument({
    required this.docId,
    required this.name,
    required this.url,
    required this.kycDocType,
    required this.fileType,
    this.createdAt,
    this.updatedAt,
  });

  final String docId;
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
      docId    : map["docId"] as String,
      name       : map["name"] as String,
      url        : map["urls"] as String,
      kycDocType : map["kycDocType"] as String,
      fileType   : map["fileType"] as String,
      createdAt  : createdAt != null ? (createdAt as Timestamp).toDate() : null,
      updatedAt  : updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    "docId"     : docId,
    "name"      : name,
    "url"      : url,
    "kycDocType": kycDocType,
    "fileType"  : fileType,
    if (createdAt != null) "createdAt": Timestamp.fromDate(createdAt!),
    if (updatedAt != null) "updatedAt": Timestamp.fromDate(updatedAt!),
  };

  @override
  List<Object?> get props => [docId, url, name, kycDocType, fileType];
}