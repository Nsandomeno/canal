import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  ///  TODO make a cloud function for updatedAt
  /// and add an optional field here.
  const Account({
    required this.plaidLink, 
    required this.baasAccount,
    required this.baseCurrency,
    this.lnurl,
    this.createdAt,
  });

  final bool plaidLink;
  final bool baasAccount;
  final String baseCurrency;
  final String? lnurl;
  final DateTime? createdAt;


  factory Account.fromMap(Map<String, dynamic> map) {
    final createdAt = map["createdAt"];
    final lnurl     = map["lnurl"];

    return Account(
      baseCurrency : map["baseCurrency"] as String,
      plaidLink    : map["plaidLink"] as bool,
      baasAccount  : map["baasAccount"] as bool,
      createdAt    : createdAt != null ? (createdAt as Timestamp).toDate() : null,
      lnurl        : lnurl,
    );
  }

  Map<String, dynamic> toMap() => {
    "baseCurrency": baseCurrency,
    "plaidLink": plaidLink,
    "baasAccount": baasAccount,
    "lnurl": lnurl,
    if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
  };

  @override
  List<Object?> get props => [baseCurrency, plaidLink, lnurl];
}

