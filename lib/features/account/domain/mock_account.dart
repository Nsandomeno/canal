import 'package:canal/features/account/domain/account.dart';
/// test account to be used in localized, demo, or test cases
const kTestPlaidLinkedAccount = Account(
  userUid: "1",
  baseCurrency: "usd",
  internalType: AccountIntType.plaidAccount,
  accountNum: "138558222",
  routingNum: "1110000022",
  accountSourceName: "Chase",
  accountKycStatus: AccountKycStatus.approved, /// default for plaid accounts
  accountType: AccountType.checking,
  balance: 1500.99,
);

const kTestBaasAccountFunded = Account(
  userUid: "2",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.checking,
  baseCurrency: "usd",
  accountNum: "1385583111",
  routingNum: "3330000055",
  accountSourceName: "Canal Virtual Checking",
  accountKycStatus: AccountKycStatus.approved,  
  balance: 2000.00
);

const kTestBaasAccountApproved = Account(
  userUid: "3",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.saving,
  baseCurrency: "usd",
  accountNum: "1385583133",
  routingNum: "3330000345",
  accountKycStatus: AccountKycStatus.approved,
  balance: 0.00
);

const kTestBaasAccountUpdateReq = Account(
  userUid: "4",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.checking,
  baseCurrency: "usd",
  accountNum: "1385583111",
  routingNum: "3330000055",
  accountKycStatus: AccountKycStatus.lockForUpdate,
);

const kTestBaasAccountPending = Account(
  userUid: "5",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.checking,
  baseCurrency: "usd",
  accountNum: "1385583991",
  routingNum: "3330000034",
  accountKycStatus: AccountKycStatus.pending,
);

const kTestBaasAccountRejected = Account(
  userUid: "6",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.checking,
  baseCurrency: "usd",
  accountNum: "1385583119",
  routingNum: "3330000023",
  accountKycStatus: AccountKycStatus.rejected,
);

const kTestBaasAccountNotStarted = Account(
  userUid: "7",
  internalType: AccountIntType.tpAccount,
  accountType: AccountType.checking,
  baseCurrency: "usd",
  accountNum: "1385583187",
  routingNum: "4330000061",
  accountKycStatus: AccountKycStatus.unInit,
);

const preloadedAccounts = [
  kTestPlaidLinkedAccount,
  kTestBaasAccountFunded,
  kTestBaasAccountApproved,
  kTestBaasAccountPending,
  kTestBaasAccountUpdateReq,
  kTestBaasAccountRejected,
  kTestBaasAccountNotStarted,
];

/// test account states
enum KTestAccountStates { 
  plaid, 
  tpFunded, 
  tpApproved, 
  tpUpdateReq, 
  tpPending, 
  tpRejected,
  tpNotStarted, 
}

extension SelectAccount on KTestAccountStates {
  String get docId {
    switch (this) {
      case KTestAccountStates.plaid:
        return "plaid";
      case KTestAccountStates.tpFunded:
        return "tp-funded";
      case KTestAccountStates.tpApproved:
        return "tp-approved";
      case KTestAccountStates.tpUpdateReq:
        return "tp-update-req";
      case KTestAccountStates.tpPending:
        return "tp-pending";
      case KTestAccountStates.tpRejected:
        return "tp-rejected";
      case KTestAccountStates.tpNotStarted:
        return "tp-not-started";
    }
  }

  String get userUid {
    switch (this) {
      case KTestAccountStates.plaid:
        return "1";
      case KTestAccountStates.tpFunded:
        return "2";
      case KTestAccountStates.tpApproved:
        return "3";
      case KTestAccountStates.tpUpdateReq:
        return "4";
      case KTestAccountStates.tpPending:
        return "5";
      case KTestAccountStates.tpRejected:
        return "6";
      case KTestAccountStates.tpNotStarted:
        return "7";
    }
  }

  Account get account {
    switch (this) {
      case KTestAccountStates.plaid:
        return kTestPlaidLinkedAccount;
      case KTestAccountStates.tpFunded:
        return kTestBaasAccountApproved;
      case KTestAccountStates.tpApproved:
        return kTestBaasAccountApproved;
      case KTestAccountStates.tpUpdateReq:
        return kTestBaasAccountUpdateReq;
      case KTestAccountStates.tpRejected:
        return kTestBaasAccountRejected;
      case KTestAccountStates.tpPending:
        return kTestBaasAccountPending;
      case KTestAccountStates.tpNotStarted:
        return kTestBaasAccountNotStarted;
    }
  }

  Account accountByDocId() {
    final KTestAccountStates variant = KTestAccountStates.values.firstWhere((vari) => vari.docId == docId);
    return variant.account;
  }
}
