part of 'objects.dart';

@JsonSerializable()
class AddressModel {
  late String addressString;
  late double latitude;
  late double longitude;

  AddressModel({
    required this.addressString,
    required this.latitude,
    required this.longitude,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
