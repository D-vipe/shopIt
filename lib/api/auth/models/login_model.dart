import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable(createFactory: false)
class Login {
  final String phone, password;
  final String? repeatPassword;

  Login({required this.phone, required this.password, this.repeatPassword});

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}
