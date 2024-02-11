

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'firebase_model.g.dart';
@JsonSerializable()
class  FireBaseNew {
 final String?FirstName, LastName;
  final String?ImageUrl;


   final int?PhoneNumber;

  FireBaseNew({
     required this.ImageUrl,  required this.FirstName, required this.LastName,  required this.PhoneNumber,re
  });


  factory FireBaseNew.fromJson(Map<String, dynamic> json)=> _$FireBaseNewFromJson(json);

  Map<String, dynamic> toJson() => _$FireBaseNewToJson(this);

  static CollectionReference<FireBaseNew> collection() {
    return FirebaseFirestore.instance.collection('random').withConverter<
        FireBaseNew>(
        fromFirestore: (snapshot, _) => FireBaseNew.fromJson(snapshot.data()!),
        toFirestore: (info, _) => info.toJson());
  }

  static DocumentReference<FireBaseNew> doc({required String clothId}) {
    return FirebaseFirestore.instance.doc('random/$clothId').withConverter<
        FireBaseNew>(
        fromFirestore: (snapshot, _) => FireBaseNew.fromJson(snapshot.data()!),
        toFirestore: (info, _) => info.toJson());
  }
}