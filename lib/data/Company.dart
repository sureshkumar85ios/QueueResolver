import 'package:json_annotation/json_annotation.dart';

part 'Company.g.dart';

@JsonSerializable()

class Company {
  String cellphoneNumber;
  String companyName;
  String emailAddress;
  int id;
  String logo;
  String phone;
  String websiteUrl;

  Company(
      {this.cellphoneNumber,
        this.companyName,
        this.emailAddress,
        this.id,
        this.logo,
        this.phone,
        this.websiteUrl});

  factory Company.fromJson(Map<String, dynamic> item) => _$CompanyFromJson(item);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

}