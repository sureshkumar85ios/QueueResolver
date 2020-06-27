// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchQueueList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

fetchQueueList _$fetchQueueListFromJson(Map<String, dynamic> json) {
  return fetchQueueList(
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    companyid: json['companyid'] as int,
    numberAllowedAtATime: json['numberAllowedAtATime'] as int,
    queueDate: json['queueDate'] as String,
    queueIntervalsInMinutes: json['queueIntervalsInMinutes'] as int,
    totalInQueue: json['totalInQueue'] as int,
  );
}

Map<String, dynamic> _$fetchQueueListToJson(fetchQueueList instance) =>
    <String, dynamic>{
      'company': instance.company?.toJson(),
      'companyid': instance.companyid,
      'numberAllowedAtATime': instance.numberAllowedAtATime,
      'queueDate': instance.queueDate,
      'queueIntervalsInMinutes': instance.queueIntervalsInMinutes,
      'totalInQueue': instance.totalInQueue,
    };
