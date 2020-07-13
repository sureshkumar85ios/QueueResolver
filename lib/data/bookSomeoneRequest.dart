import 'package:json_annotation/json_annotation.dart';

part 'bookSomeoneRequest.g.dart';

@JsonSerializable()

class bookSomeoneRequest {
  String cellphoneNumber;
  int companyId;
  String emailAddress;
  String name;
  String surname;

  bookSomeoneRequest(
      {this.cellphoneNumber,
        this.companyId,
        this.emailAddress,
        this.name,
        this.surname});

  Map<String, dynamic> toJson() => _$bookSomeoneRequestToJson(this);

}