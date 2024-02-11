
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'class_check.g.dart';


@JsonSerializable()
class Check{
  final List items;

  final DateTime? date;
  final String?ImageUrl;
  final String?FullName;
  final String?address;
  final String?contactno;
  final String?Email;
  final String?State;
  final String?CountryName;
  Check({
    required this.date,
    required this.items,
    required this.address,required this.FullName,required this.contactno,
    required this.Email,required this.CountryName,required this.State,required this.ImageUrl,
});

  factory Check.fromJson(Map<String, dynamic> json) =>
      _$CheckFromJson(json);

  Map<String, dynamic> toJson() => _$CheckToJson(this);

  static CollectionReference<Check> collection() {
    return FirebaseFirestore.instance
        .collection('lion')
        .withConverter<Check>(
        fromFirestore: (snapshot, _) => Check.fromJson(snapshot.data()!),
        toFirestore: (info, _) => info.toJson());
  }

  static DocumentReference<Check> doc({required String Id}) {
    return FirebaseFirestore.instance
        .doc('lion/$Id')
        .withConverter<Check>(
        fromFirestore: (snapshot, _) => Check.fromJson(snapshot.data()!),
        toFirestore: (info, _) => info.toJson());
  }

}