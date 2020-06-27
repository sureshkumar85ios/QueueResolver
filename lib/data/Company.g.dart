// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    cellphoneNumber: json['cellphoneNumber'] as String,
    companyName: json['companyName'] as String,
    emailAddress: json['emailAddress'] as String,
    id: json['id'] as int,
    logo: json['logo'] as String,
    phone: json['phone'] as String,
    websiteUrl: json['websiteUrl'] as String,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'cellphoneNumber': instance.cellphoneNumber,
      'companyName': instance.companyName,
      'emailAddress': instance.emailAddress,
      'id': instance.id,
      'logo': instance.logo,
      'phone': instance.phone,
      'websiteUrl': instance.websiteUrl,
    };
