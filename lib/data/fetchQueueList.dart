import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/data/Company.dart';
part 'fetchQueueList.g.dart';

@JsonSerializable(explicitToJson: true)
class fetchQueueList {
  Company company;
  int companyid;
  int numberAllowedAtATime;
  String queueDate;
  int queueIntervalsInMinutes;
  int totalInQueue;

  fetchQueueList(
      {this.company,
        this.companyid,
        this.numberAllowedAtATime,
        this.queueDate,
        this.queueIntervalsInMinutes,
        this.totalInQueue});

  factory fetchQueueList.fromJson(Map<String, dynamic> item) => _$fetchQueueListFromJson(item);
}

