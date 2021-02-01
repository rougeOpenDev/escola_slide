class CourseEntity {
  final String id;

  final int order;

  final String label;
  final String progress;

  final String image64;

  final bool active;

  CourseEntity(
      {this.id,
      this.order,
      this.label,
      this.progress,
      this.image64,
      this.active});

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    return new CourseEntity(
        id: json['id'],
        order: json['order'],
        label: json['label'],
        progress: json['progress'],
        image64: json['image64'],
        active: json['active']);
  }
}
