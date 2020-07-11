// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Queue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Queue _$QueueFromJson(Map<String, dynamic> json) {
  return Queue(
    expectedPorcessedTime: json['expectedPorcessedTime'] as String,
    id: json['id'] as int,
    name: json['name'] as String,
    personId: json['personId'] as int,
    queueNumber: json['queueNumber'] as String,
    status: json['status'] as String,
    surname: json['surname'] as String,
  );
}

Map<String, dynamic> _$QueueToJson(Queue instance) => <String, dynamic>{
      'expectedPorcessedTime': instance.expectedPorcessedTime,
      'id': instance.id,
      'name': instance.name,
      'personId': instance.personId,
      'queueNumber': instance.queueNumber,
      'status': instance.status,
      'surname': instance.surname,
    };
