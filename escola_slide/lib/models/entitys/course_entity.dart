class CourseEntity {
  final String id;

  final int order;

  final String label;
  final String description;
  final String progress;

  final String image64;

  final bool active;

  CourseEntity(
      {this.id,
      this.order,
      this.label,
      this.description,
      this.progress,
      this.image64,
      this.active});

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return new CourseEntity(
        id: json['id'],
        order: json['order'],
        label: json['label'],
        description: json['description'],
        progress: json['progress'],
        image64: json['image64'],
        active: json['active']);
  }
}
