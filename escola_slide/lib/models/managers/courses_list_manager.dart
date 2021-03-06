import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/apis/api_courses.dart';
import 'package:dio/dio.dart';

class CoursesListManager extends ChangeNotifier {
  final List<CourseEntity> _courses = [];

  // final storage = const FlutterSecureStorage();
  final ApiCourses endpointMenu = ApiCourses();
  bool _loading = false;

  CoursesListManager() {}

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

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

    loading = false;
  }
}
