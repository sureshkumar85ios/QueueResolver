// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.companyId,
    this.id,
    this.person,
    this.status,
    this.type,
    this.username,
  });

  int companyId;
  int id;
  Person person;
  String status;
  String type;
  String username;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    companyId: json["companyId"],
    id: json["id"],
    person: Person.fromJson(json["person"]),
    status: json["status"],
    type: json["type"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId,
    "id": id,
    "person": person.toJson(),
    "status": status,
    "type": type,
    "username": username,
  };
}

class Person {
  Person({
    this.address,
    this.cellphoneNumber,
    this.emailAddress,
    this.id,
    this.name,
    this.surname,
  });

  Address address;
  String cellphoneNumber;
  String emailAddress;
  int id;
  String name;
  String surname;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    address: Address.fromJson(json["address"]),
    cellphoneNumber: json["cellphoneNumber"],
    emailAddress: json["emailAddress"],
    id: json["id"],
    name: json["name"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "cellphoneNumber": cellphoneNumber,
    "emailAddress": emailAddress,
    "id": id,
    "name": name,
    "surname": surname,
  };
}

class Address {
  Address({
    this.addresLine2,
    this.addressLine,
    this.city,
    this.id,
    this.locationPin,
    this.postalCode,
    this.suburb,
  });

  String addresLine2;
  String addressLine;
  String city;
  int id;
  String locationPin;
  String postalCode;
  String suburb;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addresLine2: json["addresLine2"],
    addressLine: json["addressLine"],
    city: json["city"],
    id: json["id"],
    locationPin: json["locationPin"],
    postalCode: json["postalCode"],
    suburb: json["suburb"],
  );

  Map<String, dynamic> toJson() => {
    "addresLine2": addresLine2,
    "addressLine": addressLine,
    "city": city,
    "id": id,
    "locationPin": locationPin,
    "postalCode": postalCode,
    "suburb": suburb,
  };
}
