import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserMetadata extends Equatable {
  const UserMetadata({
    this.refreshTime,
  });

  final DateTime? refreshTime;

  factory UserMetadata.fromMap(Map<String, dynamic> map) {
    final refreshTime = map["refreshTime"];

    return UserMetadata(
      refreshTime: refreshTime != null ? (refreshTime as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() => {
    "refreshTime": refreshTime != null ? (refreshTime as Timestamp).toDate() : null,
  };

  @override
  List<Object?> get props => [refreshTime];
  
}

