// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FireBaseNew _$FireBaseNewFromJson(Map<String, dynamic> json) => FireBaseNew(
      ImageUrl: json['ImageUrl'] as String?,
      FirstName: json['FirstName'] as String?,
      LastName: json['LastName'] as String?,
      PhoneNumber: json['PhoneNumber'] as int?,
    );

Map<String, dynamic> _$FireBaseNewToJson(FireBaseNew instance) =>
    <String, dynamic>{
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'ImageUrl': instance.ImageUrl,
      'PhoneNumber': instance.PhoneNumber,
    };
