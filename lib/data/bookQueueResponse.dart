// To parse this JSON data, do
//
//     final bookQueueResponse = bookQueueResponseFromJson(jsonString);

import 'dart:convert';

BookQueueResponse bookQueueResponseFromJson(String str) => BookQueueResponse.fromJson(json.decode(str));

String bookQueueResponseToJson(BookQueueResponse data) => json.encode(data.toJson());

class BookQueueResponse {
  BookQueueResponse({
    this.companyId,
    this.expectedPorcessedTime,
    this.queueId,
    this.queueNumber,
  });

  int companyId;
  String expectedPorcessedTime;
  int queueId;
  String queueNumber;

  factory BookQueueResponse.fromJson(Map<String, dynamic> json) => BookQueueResponse(
    companyId: json["companyId"],
    expectedPorcessedTime: json["expectedPorcessedTime"],
    queueId: json["queueId"],
    queueNumber: json["queueNumber"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "expectedPorcessedTime": expectedPorcessedTime,
    "queueId": queueId,
    "queueNumber": queueNumber,
  };
}
