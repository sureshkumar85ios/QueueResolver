// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'startQueue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

startQueue _$startQueueFromJson(Map<String, dynamic> json) {
  return startQueue(
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
    id: json['id'] as int,
    numberAllowedAtATime: json['numberAllowedAtATime'] as int,
    queueDate: json['queueDate'] as String,
    queueIntervalsInMinutes: json['queueIntervalsInMinutes'] as int,
    totalInQueue: json['totalInQueue'] as int,
  );
}

Map<String, dynamic> _$startQueueToJson(startQueue instance) =>
    <String, dynamic>{
      'company': instance.company?.toJson(),
      'id': instance.id,
      'numberAllowedAtATime': instance.numberAllowedAtATime,
      'queueDate': instance.queueDate,
      'queueIntervalsInMinutes': instance.queueIntervalsInMinutes,
      'totalInQueue': instance.totalInQueue,
    };
