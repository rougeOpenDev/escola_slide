import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:escola_slide/models/entitys/course_entity.dart';
import 'package:escola_slide/apis/api_courses.dart';
import 'package:dio/dio.dart';

class CoursesDetailManager extends ChangeNotifier {
  CourseEntity _courseDetail = null;

  // final storage = const FlutterSecureStorage();
  final ApiCourses endpointMenu = ApiCourses();
  bool _loading = false;

  CoursesDetailManager() {}

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  CourseEntity get courseDetail => _courseDetail;

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
      //  _courseDetail = CourseEntity.fromJson(response.data);
    } else {}

    log(_courseDetail.toString());

    notifyListeners();
    loading = false;
  }
}
