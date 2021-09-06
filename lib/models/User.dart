import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable()
class User {
  late int? id;
  late String name;
  late String email;
  late String phone;
  late String role;

  User(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.role});

  @override
  String toString() {
    return "name:$name - email:$email";
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
