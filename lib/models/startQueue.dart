import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/data/Company.dart';

part 'startQueue.g.dart';

@JsonSerializable(explicitToJson: true)

class startQueue {
  Company company;
  int id;
  int numberAllowedAtATime;
  String queueDate;
  int queueIntervalsInMinutes;
  int totalInQueue;

  startQueue(
      {this.company,
        this.id,
        this.numberAllowedAtATime,
        this.queueDate,
        this.queueIntervalsInMinutes,
        this.totalInQueue});

  factory startQueue.fromJson(Map<String, dynamic> item) => _$startQueueFromJson(item);
  Map<String, dynamic> toJson() => _$startQueueToJson(this);
}
