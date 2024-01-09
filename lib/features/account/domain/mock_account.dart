import 'package:canal/features/account/domain/account.dart';

/// test account to be used in localized, demo, or test cases
const kTestBlankAccount = Account(
  plaidLink: false,
  baasAccount: false, 
  baseCurrency: "usd",
  accountId: "1"
);

const kTestPlaidLinkedAccount = Account(
  plaidLink: true,
  baasAccount: false,
  baseCurrency: "usd",
  accountId: "2"
);

const kTestBaasAccount = Account(
  plaidLink: false,
  baasAccount: true,
  baseCurrency: "usd",
  accountId: "2",
);

const preloadedAccounts = [
  kTestBlankAccount,
  kTestPlaidLinkedAccount,
  kTestBaasAccount,
];

/// test account states
enum KTestAccountStates { blank, plaidOnly, baasOnly }

extension SelectAccount on KTestAccountStates {
  String get docId {
    switch (this) {
      case KTestAccountStates.plaidOnly:
        return "plaidOnly";
      case KTestAccountStates.baasOnly:
        return "baasOnly";
      case KTestAccountStates.blank:
        return "blank";
    }
  }

  Account get account {
    switch (this) {
      case KTestAccountStates.plaidOnly:
        return kTestPlaidLinkedAccount;
      case KTestAccountStates.baasOnly:
        return kTestBaasAccount;
      case KTestAccountStates.blank:
        return kTestBlankAccount;
    }
  }

  Account accountByDocId() {
    final KTestAccountStates variant = KTestAccountStates.values.firstWhere((vari) => vari.docId == docId);
    return variant.account;
  }
}
