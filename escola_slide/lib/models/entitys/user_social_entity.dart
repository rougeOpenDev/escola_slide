class UserSocialEntity {
  final String facebook;
  final String instagram;

  UserSocialEntity({this.facebook, this.instagram});

  factory UserSocialEntity.fromJson(Map<String, dynamic> json) {
    return new UserSocialEntity(
        facebook: json['facebook'], instagram: json['instagram']);
  }
}
