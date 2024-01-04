//import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:canal/features/auth/domain/app_user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountRepository {
  const AccountRepository(this._firestore);
  final FirebaseFirestore _firestore;

}

final accountRepository = Provider((ref) {
  return AccountRepository(FirebaseFirestore.instance);
});
