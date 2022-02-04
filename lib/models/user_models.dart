part of 'objects.dart';

@JsonSerializable()
class UserModel {
  late String uid;
  @JsonKey(name: "phone")
  late String phoneNo;
  late String name;
  late String email;
  //AddressModel? address;
  String? address;

  UserModel({
    required this.uid,
    required this.phoneNo,
    required this.name,
    required this.email,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
