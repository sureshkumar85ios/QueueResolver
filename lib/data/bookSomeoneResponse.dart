import 'package:json_annotation/json_annotation.dart';

part 'bookSomeoneResponse.g.dart';

@JsonSerializable()
class bookSomeoneResponse {
  int companyId;
  String expectedPorcessedTime;
  int queueId;
  String queueNumber;

  bookSomeoneResponse(
      {this.companyId,
        this.expectedPorcessedTime,
        this.queueId,
        this.queueNumber});

  factory bookSomeoneResponse.fromJson(Map<String, dynamic> item) => _$bookSomeoneResponseFromJson(item);
  Map<String, dynamic> toJson() => _$bookSomeoneResponseToJson(this);
}