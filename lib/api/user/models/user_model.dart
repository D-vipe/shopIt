import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: '_id')
  final String id;
  final String? name, surname, email, phone, avatarUrl, shopId;

  User({required this.id, this.name, this.surname, this.email, this.phone, this.avatarUrl, this.shopId});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
