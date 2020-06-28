// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetchPersonBookedQueues.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

fetchPersonBookedQueues _$fetchPersonBookedQueuesFromJson(
    Map<String, dynamic> json) {
  return fetchPersonBookedQueues(
    companyId: json['companyId'] as int,
    companyName: json['companyName'] as String,
    companylogo: json['companylogo'] as String,
    expectedPorcessedTime: json['expectedPorcessedTime'] as String,
    personId: json['personId'] as int,
    queueId: json['queueId'] as int,
    queueNumber: json['queueNumber'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$fetchPersonBookedQueuesToJson(
        fetchPersonBookedQueues instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'companyName': instance.companyName,
      'companylogo': instance.companylogo,
      'expectedPorcessedTime': instance.expectedPorcessedTime,
      'personId': instance.personId,
      'queueId': instance.queueId,
      'queueNumber': instance.queueNumber,
      'status': instance.status,
    };
