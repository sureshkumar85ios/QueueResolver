// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VendorDashboard.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDashboard _$VendorDashboardFromJson(Map<String, dynamic> json) {
  return VendorDashboard(
    companyId: json['companyId'] as int,
    companyName: json['companyName'] as String,
    id: json['id'] as int,
    logo: json['logo'] as String,
    numberAllowedAtATime: json['numberAllowedAtATime'] as int,
    queue: (json['queue'] as List)
        ?.map(
            (e) => e == null ? null : Queue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    queueDate: json['queueDate'] as String,
    totalInQueue: json['totalInQueue'] as int,
  );
}

Map<String, dynamic> _$VendorDashboardToJson(VendorDashboard instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'id': instance.id,
      'logo': instance.logo,
      'numberAllowedAtATime': instance.numberAllowedAtATime,
      'queue': instance.queue?.map((e) => e?.toJson())?.toList(),
      'queueDate': instance.queueDate,
      'totalInQueue': instance.totalInQueue,
    };
