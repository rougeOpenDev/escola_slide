import 'package:escola_slide/models/entitys/user_social_entity.dart';

class UserEntity {
  final String id;

  final String name;
  final String username;
  final String email;
  final String city;
  final String website;
  final UserSocialEntity social;
  final String nextContentToView;

  UserEntity(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.city,
      this.website,
      this.social,
      this.nextContentToView});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return new UserEntity(
        id: json['id'],
        name: json['name'],
        username: json['username'],
        email: json['email'],
        city: json['city'],
        website: json['website'],
        social: UserSocialEntity.fromJson(json['social']),
        nextContentToView: json['nextContentToView']);
  }
}
