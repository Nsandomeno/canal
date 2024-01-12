import 'package:canal/features/account/domain/account.dart';

/// test account to be used in localized, demo, or test cases
const kTestBlankAccount = Account(
  baseCurrency: "usd",
  plaidBankAccountNumber: null,
  bankAccountNumber: null,
);

const kTestPlaidLinkedAccount = Account(
  baseCurrency: "usd",
  bankAccountNumber: null,
  plaidBankAccountNumber: "138558222",
  plaidBankName: "Chase",
  plaidBankType: "Checking",
);

const kTestBaasAccountApproved = Account(
  baseCurrency: "usd",
  plaidBankAccountNumber: null,
  bankAccountNumber: "1385583111",
  bankAccountRouting: "3330000055",
  bankAccountType: "Canal Virtual Checking",
  bankAccountKycStatus: "approved",
);

const kTestBaasAccountPending = Account(
  baseCurrency: "usd",
  plaidBankAccountNumber: null,
  bankAccountNumber: "1385583111",
  bankAccountRouting: "3330000055",
  bankAccountType: "Canal Virtual Checking",
  bankAccountKycStatus: "pending",
);

const kTestBaasAccountRejected = Account(
  baseCurrency: "usd",
  plaidBankAccountNumber: null,
  bankAccountNumber: "1385583111",
  bankAccountRouting: "3330000055",
  bankAccountType: "Canal Virtual Checking",
  bankAccountKycStatus: "failed",
);

const preloadedAccounts = [
  kTestBlankAccount,
  kTestPlaidLinkedAccount,
  kTestBaasAccountApproved,
  kTestBaasAccountPending,
  kTestBaasAccountRejected,
];

/// test account states
enum KTestAccountStates { blank, plaidOnly, baasOnly, baasPending, baasRejected }

extension SelectAccount on KTestAccountStates {
  String get docId {
    switch (this) {
      case KTestAccountStates.plaidOnly:
        return "plaidOnly";
      case KTestAccountStates.baasOnly:
        return "baasOnly";
      case KTestAccountStates.blank:
        return "blank";
      case KTestAccountStates.baasPending:
        return "baasPending";
      case KTestAccountStates.baasRejected:
        return "baasRejected";
    }
  }

  Account get account {
    switch (this) {
      case KTestAccountStates.plaidOnly:
        return kTestPlaidLinkedAccount;
      case KTestAccountStates.baasOnly:
        return kTestBaasAccountApproved;
      case KTestAccountStates.blank:
        return kTestBlankAccount;
      case KTestAccountStates.baasPending:
        return kTestBaasAccountPending;
      case KTestAccountStates.baasRejected:
        return kTestBaasAccountRejected;
    }
  }

  Account accountByDocId() {
    final KTestAccountStates variant = KTestAccountStates.values.firstWhere((vari) => vari.docId == docId);
    return variant.account;
  }
}
