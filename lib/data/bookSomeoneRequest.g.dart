// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookSomeoneRequest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

bookSomeoneRequest _$bookSomeoneRequestFromJson(Map<String, dynamic> json) {
  return bookSomeoneRequest(
    cellphoneNumber: json['cellphoneNumber'] as String,
    companyId: json['companyId'] as int,
    emailAddress: json['emailAddress'] as String,
    name: json['name'] as String,
    surname: json['surname'] as String,
  );
}

Map<String, dynamic> _$bookSomeoneRequestToJson(bookSomeoneRequest instance) =>
    <String, dynamic>{
      'cellphoneNumber': instance.cellphoneNumber,
      'companyId': instance.companyId,
      'emailAddress': instance.emailAddress,
      'name': instance.name,
      'surname': instance.surname,
    };
