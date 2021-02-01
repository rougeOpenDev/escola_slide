class WebVideoEntity {
  final String id;

  final String label;
  final String url;
  final String plataform;

  final bool active;

  final String idUser;

  WebVideoEntity(
      {this.id,
      this.label,
      this.url,
      this.plataform,
      this.active,
      this.idUser});

  factory WebVideoEntity.fromJson(Map<String, dynamic> json) {
    return new WebVideoEntity(
        id: json['id'],
        label: json['label'],
        url: json['url'],
        plataform: json['plataform'],
        active: json['active'],
        idUser: json['idUser']);
  }
}
