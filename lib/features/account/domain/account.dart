import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

const CANAL_VIRTUAL_ACCOUNT_SOURCE_NAME = "Canal Virtual (via Treasury Prime)";

enum SupportedCurrency { usd }
/// * bank account types
enum AccountType       { checking, saving, credit, currency }
/// * internal account type
enum AccountIntType    { 
  tpAccount, 
  plaidAccount;

  static AccountIntType fromString(String s) => switch (s) {
    "tpAccount" => tpAccount,
    "plaidAccount" => plaidAccount,
    _ => throw UnsupportedError("Something went wrong. $s is not an AccountIntType.")
  };
}
/// * kyc statuses
enum AccountKycStatus  {
    unInit, 
    pending, 
    lockForUpdate, 
    rejected, 
    approved;

    static AccountKycStatus fromString(String? s) => switch (s) {
      null => unInit,
      "unInit" => unInit,
      "pending" => pending,
      "lockForUpdate" => lockForUpdate,
      "rejected" => rejected,
      "approved" => approved,
      _ => unInit,
    };
  }

class Account extends Equatable {
  const Account({
    required this.userUid,
    this.baseCurrency = "usd",
    required this.internalType,
    this.accountType,
    this.accountSourceName, /// Chase, Bank of America etc.
    this.accountSourceId, /// mostly thinking of plaid here (accountId)
    this.accountSourceItemId, /// mostly thinking of plaid here (itemId)
    this.accountSourceAccessToken, /// mostly thinking of plaid here (accessToken)
    this.accountSourceProcessorToken, /// mostly thinking of plaid here (processorToken)
    this.accountNum,
    this.accountKycStatus = AccountKycStatus.unInit,
    this.routingNum,
    this.balance = 0.00,
    this.createdAt,
    this.updatedAt,
  });

  final String userUid;
  final String baseCurrency;
  final double balance;
  final AccountIntType internalType;
  final AccountType? accountType;
  final String? accountSourceName;
  final String? accountNum;
  final String? routingNum;
  final String? accountSourceId;
  final String? accountSourceItemId;
  final String? accountSourceAccessToken;
  final String? accountSourceProcessorToken;
  final AccountKycStatus accountKycStatus;
  /// meta (consider handling with triggers i.e. firebase cloud functions for now).
  final DateTime? updatedAt;
  final DateTime? createdAt;

  factory Account.fromMap(Map<String, dynamic> map) {
    /// nullable attributes
    final accountNum = map["accountNum"];
    final routingNum = map["routingNum"];
    final accountSourceId = map["accountSourceId"];
    final accountSourceItemId = map["accountSourceItemId"];
    final accountSourceAccessToken = map["accountSourceAccessToken"];
    final accountSourceProcessorToken = map["accountSourceProcessorToken"];
    final createdAt = map["createdAt"];
    final updatedAt = map["updatedAt"];
    /// type check that potential int is represented as double
    final num balance = map["balance"];
    /// enum variants --> String
    /// TODO handle the case or ensure the caller is informed that this field
    ///      must be an enum variant 
    final accountTypeValue = map["accountType"];
    final accountKycStatusValue = map["accountKycStatus"];

    return Account(
      userUid: map["userUid"] as String,
      baseCurrency: (map["baseCurrency"] ?? "usd") as String,
      balance: balance.toDouble(),
      accountType: accountTypeValue as AccountType?,
      internalType: AccountIntType.fromString(map["internalType"]),
      accountKycStatus: AccountKycStatus.fromString(map["accountKycStatus"]),
      accountSourceName: map["accountSourceName"] as String? ?? CANAL_VIRTUAL_ACCOUNT_SOURCE_NAME,
      accountSourceId: accountSourceId as String?,
      accountSourceItemId: accountSourceItemId as String?,
      accountSourceAccessToken: accountSourceAccessToken as String?,
      accountSourceProcessorToken: accountSourceProcessorToken as String?,
      accountNum: accountNum as String?,
      routingNum: routingNum as String?,
      createdAt: createdAt != null ? (createdAt as Timestamp).toDate() : null,
      updatedAt: updatedAt != null ? (updatedAt as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    "userUid"     : userUid,
    "baseCurrency": baseCurrency,
    "balance"     : balance,
    "accountType" : accountType,
    "internalType": internalType,
    "accountKycStatus": accountKycStatus,

    if (createdAt != null) 'createdAt': Timestamp.fromDate(createdAt!),
    if (updatedAt != null) 'updatedAt': Timestamp.fromDate(updatedAt!),
  };

  @override
  List<Object?> get props => [
    baseCurrency, 
    balance, 
    internalType, 
    accountSourceName, 
    accountType, 
    accountKycStatus, 
    accountNum
  ];
}

