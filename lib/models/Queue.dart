import 'package:json_annotation/json_annotation.dart';

part 'Queue.g.dart';

@JsonSerializable()

class Queue {
  String expectedPorcessedTime;
  int id;
  String name;
  int personId;
  String queueNumber;
  String status;
  String surname;

  Queue(
      {this.expectedPorcessedTime,
        this.id,
        this.name,
        this.personId,
        this.queueNumber,
        this.status,
        this.surname});

  factory Queue.fromJson(Map<String, dynamic> item) => _$QueueFromJson(item);
  Map<String, dynamic> toJson() => _$QueueToJson(this);

}