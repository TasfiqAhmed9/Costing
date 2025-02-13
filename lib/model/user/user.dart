// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "country")
  String? country;

  @JsonKey(name: "t@gmail.com")
  String? email;

  @JsonKey(name: "image")
  String? img;

  @JsonKey(name: "9 February 2025 at 12:47:22")
  dynamic createdOn;

  User(
      {this.id,
      this.name,
      this.phone,
      this.country,
      this.email,
      this.img,
      this.createdOn});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

