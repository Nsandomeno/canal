import 'package:canal/features/account/domain/account.dart';
/// test account to be used until in localized, demo, or test cases
const kTestBlankAccount = Account(
  plaidLink: false,
  baasAccount: false, 
  baseCurrency: "usd",
);

const kTestPlaidLinkedAccount = Account(
  plaidLink: true,
  baasAccount: false,
  baseCurrency: "usd",
);

const kTestBaasAccount = Account(
  plaidLink: false,
  baasAccount: true,
  baseCurrency: "usd",
);