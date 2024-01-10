// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:canal/features/account/domain/account.dart';
// import 'package:canal/features/account/domain/document.dart';

// part 'account_repository.g.dart';

// class AccountRepository {
//   const AccountRepository(this._firestore);
//   final FirebaseFirestore _firestore;

//   Future<Account?> fetchAccount(String uid) async {
//     return Future.value(null);
//   }

//   Stream<Account?> watchAccount(String uid) {
//     return Stream.value(null);
//   }


// }

// @Riverpod(keepAlive: true)
// AccountRepository accountRepository(AccountRepositoryRef ref) {
//   return AccountRepository(FirebaseFirestore.instance);
// }
