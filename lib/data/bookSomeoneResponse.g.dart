// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookSomeoneResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

bookSomeoneResponse _$bookSomeoneResponseFromJson(Map<String, dynamic> json) {
  return bookSomeoneResponse(
    companyId: json['companyId'] as int,
    expectedPorcessedTime: json['expectedPorcessedTime'] as String,
    queueId: json['queueId'] as int,
    queueNumber: json['queueNumber'] as String,
  );
}

Map<String, dynamic> _$bookSomeoneResponseToJson(
        bookSomeoneResponse instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'expectedPorcessedTime': instance.expectedPorcessedTime,
      'queueId': instance.queueId,
      'queueNumber': instance.queueNumber,
    };
