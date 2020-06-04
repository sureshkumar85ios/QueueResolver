// To parse this JSON data, do
//
//     final shopList = shopListFromJson(jsonString);

import 'dart:convert';

List<ShopList> shopListFromJson(String str) => List<ShopList>.from(json.decode(str).map((x) => ShopList.fromJson(x)));

String shopListToJson(List<ShopList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ShopList {
  ShopList({
    this.address,
    this.cellphoneNumber,
    this.companyName,
    this.contactPerson,
    this.dateCreated,
    this.emailAddress,
    this.id,
    this.isCompanyActive,
    this.phone,
    this.websiteUrl,
  });

  Address address;
  String cellphoneNumber;
  String companyName;
  ContactPerson contactPerson;
  DateTime dateCreated;
  String emailAddress;
  int id;
  bool isCompanyActive;
  String phone;
  String websiteUrl;

  factory ShopList.fromJson(Map<String, dynamic> json) => ShopList(
    address: Address.fromJson(json["address"]),
    cellphoneNumber: json["cellphoneNumber"],
    companyName: json["companyName"],
    contactPerson: ContactPerson.fromJson(json["contactPerson"]),
    //dateCreated: DateTime.parse(json["dateCreated"]),
    emailAddress: json["emailAddress"],
    //id: json["id"],
    isCompanyActive: json["isCompanyActive"],
    phone: json["phone"],
    websiteUrl: json["websiteUrl"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "cellphoneNumber": cellphoneNumber,
    "companyName": companyName,
    "contactPerson": contactPerson.toJson(),
    //"dateCreated": dateCreated.toIso8601String(),
    "emailAddress": emailAddress,
    "id": id,
    "isCompanyActive": isCompanyActive,
    "phone": phone,
    "websiteUrl": websiteUrl,
  };
}

class Address {
  Address({
    this.addresLine2,
    this.addressLine,
    this.city,
    this.dateCreated,
    this.id,
    this.locationPin,
    this.postalCode,
    this.suburb,
  });

  String addresLine2;
  String addressLine;
  String city;
  DateTime dateCreated;
  int id;
  String locationPin;
  String postalCode;
  String suburb;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addresLine2: json["addresLine2"],
    addressLine: json["addressLine"],
    city: json["city"],
    //dateCreated: DateTime.parse(json["dateCreated"]),
    id: json["id"],
    locationPin: json["locationPin"],
    postalCode: json["postalCode"],
    suburb: json["suburb"],
  );

  Map<String, dynamic> toJson() => {
    "addresLine2": addresLine2,
    "addressLine": addressLine,
    "city": city,
    //"dateCreated": dateCreated.toIso8601String(),
    "id": id,
    "locationPin": locationPin,
    "postalCode": postalCode,
    "suburb": suburb,
  };
}

class ContactPerson {
  ContactPerson({
    this.address,
    this.cellphoneNumber,
    this.dateCreated,
    this.emailAddress,
    this.id,
    this.idNumber,
    this.name,
    this.surname,
  });

  Address address;
  String cellphoneNumber;
  DateTime dateCreated;
  String emailAddress;
  int id;
  String idNumber;
  String name;
  String surname;

  factory ContactPerson.fromJson(Map<String, dynamic> json) => ContactPerson(
    address: Address.fromJson(json["address"]),
    cellphoneNumber: json["cellphoneNumber"],
    //dateCreated: DateTime.parse(json["dateCreated"]),
    emailAddress: json["emailAddress"],
    id: json["id"],
    idNumber: json["idNumber"],
    name: json["name"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "cellphoneNumber": cellphoneNumber,
   // "dateCreated": dateCreated.toIso8601String(),
    "emailAddress": emailAddress,
    "id": id,
    "idNumber": idNumber,
    "name": name,
    "surname": surname,
  };
}
