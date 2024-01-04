import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  // passwordHash should not be null!!!
  
  // TODO require passwordHash when figured out how to retrieve
  // from the user object in the functions codebase.
  const Account({
    required this.plaidLink, 
    required this.email,
    required this.baasAccount,
    required this.baseCurrency,
    required this.emailVerified,
    this.lnurl,
    this.passwordHash,
    this.createdAt,
    //this.updatedAt,
  });

  final bool plaidLink;
  final bool baasAccount;
  final String email;
  final bool emailVerified;
  final String baseCurrency;
  final String? lnurl;
  final String? passwordHash;
  final DateTime? createdAt;
  //final DateTime? updatedAt;


  factory Account.fromMap(Map<String, dynamic> map) {
    final createdAt = map["createdAt"];
    //final updatedAt = map["updatedAt"];
    final lnurl = map["lnurl"];
    final passHash = map["passwordHash"];

    return Account(
      baseCurrency: map["baseCurrency"] as String,
      plaidLink: map["plaidLink"] as bool,
      baasAccount: map["baasAccount"] as bool,
      email: map["email"] as String,
      emailVerified: map["emailVerified"] as bool,
      createdAt: createdAt != null ? (createdAt as Timestamp).toDate() : null,
      lnurl: lnurl,
      passwordHash: passHash,
      //updatedAt: updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    // intentional excludes password hash
    "baseCurrency": baseCurrency,
    "plaidLink": plaidLink,
    "baasAccount": baasAccount,
    "email": email,
    "emailVerified": emailVerified,
    "lnurl": lnurl,
    if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    //if (updatedAt != null) 'updatedAt': Timestamp.fromDate(createdAt!), 
  };

  @override
  List<Object?> get props => [baseCurrency, plaidLink, lnurl];
}

