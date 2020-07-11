import 'package:json_annotation/json_annotation.dart';
import 'package:my_app/models/Queue.dart';

part 'VendorDashboard.g.dart';

@JsonSerializable(explicitToJson: true)

class VendorDashboard {
  int companyId;
  String companyName;
  int id;
  String logo;
  int numberAllowedAtATime;
  List<Queue> queue;
  String queueDate;
  int totalInQueue;

  VendorDashboard(
      {this.companyId,
        this.companyName,
        this.id,
        this.logo,
        this.numberAllowedAtATime,
        this.queue,
        this.queueDate,
        this.totalInQueue});

  factory VendorDashboard.fromJson(Map<String, dynamic> item) => _$VendorDashboardFromJson(item);
  Map<String, dynamic> toJson() => _$VendorDashboardToJson(this);

}
