part of 'objects.dart';

@JsonSerializable()
class CategoryModel {
  String id;
  @JsonKey(defaultValue: "")
  String svgName;
  String category;

  CategoryModel({
    required this.id,
    required this.svgName,
    required this.category,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}
