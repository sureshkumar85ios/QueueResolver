import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signupModel.g.dart';

@JsonSerializable()
class signupModel {
  String cellphoneNumber;
  String emailAddress;
  String locationPin;
  String name;
  String password;
  String postalCode;
  String surname;
  String type;
  String username;

  signupModel({@required this.cellphoneNumber,
    @required this.emailAddress,
    this.locationPin,
    @required this.name,
    @required this.password,
    @required this.postalCode,
    @required this.surname,
    @required this.type,
    @required this.username});

  Map<String, dynamic> toJson() => _$signupModelToJson(this);
}
