// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signupModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

signupModel _$signupModelFromJson(Map<String, dynamic> json) {
  return signupModel(
    cellphoneNumber: json['cellphoneNumber'] as String,
    emailAddress: json['emailAddress'] as String,
    locationPin: json['locationPin'] as String,
    name: json['name'] as String,
    password: json['password'] as String,
    postalCode: json['postalCode'] as String,
    surname: json['surname'] as String,
    type: json['type'] as String,
    username: json['username'] as String,
  );
}

Map<String, dynamic> _$signupModelToJson(signupModel instance) =>
    <String, dynamic>{
      'cellphoneNumber': instance.cellphoneNumber,
      'emailAddress': instance.emailAddress,
      'locationPin': instance.locationPin,
      'name': instance.name,
      'password': instance.password,
      'postalCode': instance.postalCode,
      'surname': instance.surname,
      'type': instance.type,
      'username': instance.username,
    };
