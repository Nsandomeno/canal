import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  const Account({
    required this.uid, 
    required this.plaidStatus, 
    required this.plaidCurrency,
    this.lnurl,
    this.createdAt,
    this.updatedAt,
  });

  final String uid;
  final bool plaidStatus;
  final String plaidCurrency;
  final String? lnurl;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  factory Account.fromMap(Map<String, dynamic> map) {
    final createdAt = map["createdAt"];
    final updatedAt = map["updatedAt"];
    final lnurl = map["lnurl"];

    return Account(
      uid: map["uid"] as String,
      plaidCurrency: map["plaidCurrency"] as String,
      plaidStatus: map["plaidStatus"] as bool,
      createdAt: createdAt != null ? (createdAt as Timestamp).toDate() : null,
      updatedAt: updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
      lnurl: lnurl
    );
  }

  Map<String, dynamic> toMap() => {
    "uid": uid,
    "plaidCurrency": plaidCurrency,
    "plaidStatus": plaidStatus,
    "lnurl": lnurl,
    if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    if (updatedAt != null) 'updatedAt': Timestamp.fromDate(createdAt!), 
  };

  @override
  List<Object?> get props => [uid, plaidCurrency, plaidStatus, lnurl];
}

