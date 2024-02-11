// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_check.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Check _$CheckFromJson(Map<String, dynamic> json) => Check(
      date: DateTime.parse(json['date']as String),
      ImageUrl: json['ImageUrl']as String,
      address: json['address'] as String,
      FullName: json['FullName'] as String,
       contactno: json['contactno'] as String,
      Email: json['Email'] as String,
      CountryName: json['CountryName'] as String,
      State: json['State'] as String, items:json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$CheckToJson(Check instance) => <String, dynamic>{
      'FullName': instance.FullName,
      'address': instance.address,
      'contactno': instance.contactno,
      'Email': instance.Email,
      'State': instance.State,
      'CountryName': instance.CountryName,
      'ImageUrl':instance.ImageUrl,
      'items':instance.items,
      'date':instance.date?.toIso8601String(),
    };
