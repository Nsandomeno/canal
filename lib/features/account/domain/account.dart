import 'package:canal/features/account/domain/document.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Account extends Equatable {
  ///  TODO make a cloud function for updatedAt
  /// and add an optional field here.
  const Account({
    this.baseCurrency = "USD",
    this.plaidBankType,
    this.plaidBankName,
    this.plaidBankAccountNumber,
    this.bankAccountType,
    this.bankAccountKycStatus,
    this.bankAccountNumber,
    this.bankAccountRouting,
    this.createdAt,
    this.updatedAt,
  });

  final String baseCurrency;
  /// plaid
  final String? plaidBankAccountNumber;
  final String? plaidBankName;
  final String? plaidBankType;
  /// baas provider
  final String? bankAccountType;
  final String? bankAccountKycStatus;
  final String? bankAccountNumber;
  final String? bankAccountRouting;
  /// meta (consider handling with triggers i.e. firebase cloud functions for now).
  final DateTime? updatedAt;
  final DateTime? createdAt;


  factory Account.fromMap(Map<String, dynamic> map) {
    final createdAt = map["createdAt"];
    final updatedAt = map["updatedAt"];

    return Account(
      baseCurrency: map["baseCurrency"] as String, /// enumerate
      plaidBankType: map["plaidBankType"] as String?,
      plaidBankName: map["plaidBankName"] as String?,
      plaidBankAccountNumber: map["plaidBankAccountNumber"] as String?,
      bankAccountNumber: map["bankAccountNumber"] as String?,
      bankAccountRouting: map["bankAccountRouting"] as String?,
      bankAccountKycStatus: map["bankAccountKycStatus"] as String?, /// enumerate
      bankAccountType: map["bankAccountType"] as String?, /// enumerate
      createdAt: createdAt != null ? (createdAt as Timestamp).toDate() : null, /// applied server-side
      updatedAt: updatedAt != null ? (updatedAt as Timestamp).toDate() : null, /// applied server-side
    );
  }

  Map<String, dynamic> toMap() => {
    "baseCurrency": baseCurrency,
    "plaidBankType": plaidBankType,
    "plaidBankName": plaidBankName,
    "plaidBankAccountNumber": plaidBankAccountNumber,
    "bankAccountNumber": bankAccountNumber,
    "bankAccountRouting": bankAccountRouting,
    "bankAccountType": bankAccountType,
    "bankAccountKycStatus": bankAccountKycStatus,
    if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    if (updatedAt != null) 'updatedAt': Timestamp.fromDate(updatedAt!),
  };

  @override
  List<Object?> get props => [baseCurrency];
}

