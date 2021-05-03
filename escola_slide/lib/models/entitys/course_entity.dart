import 'package:escola_slide/models/entitys/course_content_entity.dart';

class CourseEntity {
  final String id;

  final int order;

  final String label;
  final String description;
  final String progress;

  final String image64;

  final bool active;

  final List<CourseContentEntity> contents;

  CourseEntity(
      {this.id,
      this.order,
      this.label,
      this.description,
      this.progress,
      this.image64,
      this.active,
      this.contents});

  factory CourseEntity.fromJson(Map<String, dynamic> json) {
    const List<CourseContentEntity> contents = [];

    if (json['contents'] != null) {}

    return new CourseEntity(
        id: json['id'],
        order: json['order'],
        label: json['label'],
        description: json['description'],
        progress: json['progress'],
        image64: json['image64'],
        active: json['active'],
        contents: contents);
  }
}
