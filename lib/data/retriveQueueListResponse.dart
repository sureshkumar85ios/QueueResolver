// To parse this JSON data, do
//
//     final retriveQueueListResponse = retriveQueueListResponseFromJson(jsonString);

import 'dart:convert';

RetriveQueueListResponse retriveQueueListResponseFromJson(String str) => RetriveQueueListResponse.fromJson(json.decode(str));

String retriveQueueListResponseToJson(RetriveQueueListResponse data) => json.encode(data.toJson());

class RetriveQueueListResponse {
  RetriveQueueListResponse({
    this.expectedPorcessedTime,
    this.id,
    this.person,
    this.queueDateTime,
    this.queueHeader,
    this.queueNumber,
    this.status,
  });

  String expectedPorcessedTime;
  int id;
  Person person;
  String queueDateTime;
  QueueHeader queueHeader;
  String queueNumber;
  String status;

  factory RetriveQueueListResponse.fromJson(Map<String, dynamic> json) => RetriveQueueListResponse(
    expectedPorcessedTime: json["expectedPorcessedTime"],
    id: json["id"],
    person: Person.fromJson(json["person"]),
    queueDateTime: json["queueDateTime"],
    queueHeader: QueueHeader.fromJson(json["queueHeader"]),
    queueNumber: json["queueNumber"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "expectedPorcessedTime": expectedPorcessedTime,
    "id": id,
    "person": person.toJson(),
    "queueDateTime": queueDateTime,
    "queueHeader": queueHeader.toJson(),
    "queueNumber": queueNumber,
    "status": status,
  };
}

class Person {
  Person({
    this.address,
    this.cellphoneNumber,
    this.emailAddress,
    this.id,
    this.idNumber,
    this.name,
    this.surname,
  });

  Address address;
  String cellphoneNumber;
  String emailAddress;
  int id;
  String idNumber;
  String name;
  String surname;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    address: Address.fromJson(json["address"]),
    cellphoneNumber: json["cellphoneNumber"],
    emailAddress: json["emailAddress"],
    id: json["id"],
    idNumber: json["idNumber"],
    name: json["name"],
    surname: json["surname"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "cellphoneNumber": cellphoneNumber,
    "emailAddress": emailAddress,
    "id": id,
    "idNumber": idNumber,
    "name": name,
    "surname": surname,
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
  String dateCreated;
  int id;
  String locationPin;
  String postalCode;
  String suburb;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    addresLine2: json["addresLine2"],
    addressLine: json["addressLine"],
    city: json["city"],
    dateCreated: json["dateCreated"],
    id: json["id"],
    locationPin: json["locationPin"],
    postalCode: json["postalCode"],
    suburb: json["suburb"],
  );

  Map<String, dynamic> toJson() => {
    "addresLine2": addresLine2,
    "addressLine": addressLine,
    "city": city,
    "dateCreated": dateCreated,
    "id": id,
    "locationPin": locationPin,
    "postalCode": postalCode,
    "suburb": suburb,
  };
}

class QueueHeader {
  QueueHeader({
    this.company,
    this.createdBy,
    this.id,
    this.name,
    this.numberAllowedAtATime,
    this.queueEndDateTime,
    this.queueIntervalsInMinutes,
    this.reasonForStopping,
    this.status,
    this.totalInQueue,
  });

  Company company;
  CreatedBy createdBy;
  int id;
  String name;
  int numberAllowedAtATime;
  String queueEndDateTime;
  int queueIntervalsInMinutes;
  String reasonForStopping;
  String status;
  int totalInQueue;

  factory QueueHeader.fromJson(Map<String, dynamic> json) => QueueHeader(
    company: Company.fromJson(json["company"]),
    createdBy: CreatedBy.fromJson(json["createdBY"]),
    id: json["id"],
    name: json["name"],
    numberAllowedAtATime: json["numberAllowedAtATime"],
    queueEndDateTime: json["queueEndDateTime"],
    queueIntervalsInMinutes: json["queueIntervalsInMinutes"],
    reasonForStopping: json["reasonForStopping"],
    status: json["status"],
    totalInQueue: json["totalInQueue"],
  );

  Map<String, dynamic> toJson() => {
    "company": company.toJson(),
    "createdBY": createdBy.toJson(),
    "id": id,
    "name": name,
    "numberAllowedAtATime": numberAllowedAtATime,
    "queueEndDateTime": queueEndDateTime,
    "queueIntervalsInMinutes": queueIntervalsInMinutes,
    "reasonForStopping": reasonForStopping,
    "status": status,
    "totalInQueue": totalInQueue,
  };
}

class Company {
  Company({
    this.address,
    this.cellphoneNumber,
    this.companyName,
    this.contactPerson,
    this.emailAddress,
    this.id,
    this.logo,
    this.phone,
    this.websiteUrl,
  });

  Address address;
  String cellphoneNumber;
  String companyName;
  Person contactPerson;
  String emailAddress;
  int id;
  String logo;
  String phone;
  String websiteUrl;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    address: Address.fromJson(json["address"]),
    cellphoneNumber: json["cellphoneNumber"],
    companyName: json["companyName"],
    contactPerson: Person.fromJson(json["contactPerson"]),
    emailAddress: json["emailAddress"],
    id: json["id"],
    logo: json["logo"],
    phone: json["phone"],
    websiteUrl: json["websiteUrl"],
  );

  Map<String, dynamic> toJson() => {
    "address": address.toJson(),
    "cellphoneNumber": cellphoneNumber,
    "companyName": companyName,
    "contactPerson": contactPerson.toJson(),
    "emailAddress": emailAddress,
    "id": id,
    "logo": logo,
    "phone": phone,
    "websiteUrl": websiteUrl,
  };
}

class CreatedBy {
  CreatedBy({
    this.id,
    this.lastSignedIn,
    this.person,
    this.status,
    this.type,
    this.username,
  });

  int id;
  String lastSignedIn;
  Person person;
  String status;
  String type;
  String username;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
    id: json["id"],
    lastSignedIn: json["lastSignedIn"],
    person: Person.fromJson(json["person"]),
    status: json["status"],
    type: json["type"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "lastSignedIn": lastSignedIn,
    "person": person.toJson(),
    "status": status,
    "type": type,
    "username": username,
  };
}