import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart'; 

@JsonSerializable()
class User {
  @JsonKey(name: 'id')
  int? userId;
  String? name;
  String? email;
  String? gender;
  String? status;

  User({this.userId, this.name, this.email, this.gender, this.status});
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
