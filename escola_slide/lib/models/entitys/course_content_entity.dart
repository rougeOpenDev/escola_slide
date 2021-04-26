class CourseContentEntity {
  final String id;

  final int order;

  final String label;

  final String progress;

  final bool active;

  final String description;
  final String link;

  final String contentType;

  CourseContentEntity(
      {this.id,
      this.order,
      this.label,
      this.progress,
      this.active,
      this.description,
      this.link,
      this.contentType});

  factory CourseContentEntity.fromJson(Map<String, dynamic> json) {
    return new CourseContentEntity(
        id: json['id'],
        order: json['order'],
        label: json['label'],
        progress: json['progress'],
        active: json['active'],
        description: json['description'],
        link: json['link'],
        contentType: json['contentType']);
  }
}
