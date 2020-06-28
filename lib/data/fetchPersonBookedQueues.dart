import 'package:json_annotation/json_annotation.dart';
part 'fetchPersonBookedQueues.g.dart';

@JsonSerializable()
class fetchPersonBookedQueues {
  int companyId;
  String companyName;
  String companylogo;
  String expectedPorcessedTime;
  int personId;
  int queueId;
  String queueNumber;
  String status;

  fetchPersonBookedQueues(
      {this.companyId,
        this.companyName,
        this.companylogo,
        this.expectedPorcessedTime,
        this.personId,
        this.queueId,
        this.queueNumber,
        this.status});
  factory fetchPersonBookedQueues.fromJson(Map<String, dynamic> item) => _$fetchPersonBookedQueuesFromJson(item);

}