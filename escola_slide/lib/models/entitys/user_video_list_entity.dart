class UserVideoListEntity {
  final String id;

  final String label;

  final String progress;

  final bool active;

  final String idUser;

  UserVideoListEntity(
      {this.id, this.label, this.progress, this.active, this.idUser});

  factory UserVideoListEntity.fromJson(Map<String, dynamic> json) {
    return new UserVideoListEntity(
        id: json['id'],
        label: json['label'],
        progress: json['progress'],
        active: json['active'],
        idUser: json['idUser']);
  }
}
