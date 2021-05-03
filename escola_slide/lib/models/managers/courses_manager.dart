import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/apis/api_courses.dart';
import 'package:dio/dio.dart';

class CoursesManager extends ChangeNotifier {
  final List<CourseEntity> _courses = [];
  CourseEntity _courseDetail = null;

  // final storage = const FlutterSecureStorage();
  final ApiCourses endpointMenu = ApiCourses();
  bool _loading = false;

  CoursesManager() {}

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CourseEntity get courseDetail => _courseDetail;

  List<CourseEntity> get courses => _courses;

  int get coursesCount {
    return _courses.length;
  }

  Future<void> getAllCourses() async {
    log('Getting avalible courses . . .');
    loading = true;
    final Dio dio = Dio();
    // final token = await storage.read(key: 'token');
    final response = await endpointMenu.getCourses(
        dio, '\$2b\$10\$BZqF.T5fzqMKdPBpavvzAOoSGEh7GTRhLyJmhm3x.1VBNGWkmtEjq');

    if (response.statusCode == 200) {
      _courses.clear();
      _courses.addAll((response.data as List<dynamic>)
          .map((menu) => CourseEntity.fromJson(menu))
          .toList());
    } else {}

    notifyListeners();
    loading = false;
  }

  Future<void> getCourseDetails(CourseEntity course) async {
    log('Getting detail course . . .');
    loading = true;
    final Dio dio = Dio();
    // final token = await storage.read(key: 'token');
    final response = await endpointMenu.getCourseDetails(
        dio,
        '\$2b\$10\$BZqF.T5fzqMKdPBpavvzAOoSGEh7GTRhLyJmhm3x.1VBNGWkmtEjq',
        course.id);

    if (response.statusCode == 200) {
      _courseDetail = CourseEntity.fromJson(response.data);
    } else {}

    notifyListeners();
    loading = false;
  }
}
