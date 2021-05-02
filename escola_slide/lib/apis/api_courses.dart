import 'dart:developer';

import 'package:dio/dio.dart';

class ApiCourses {
  Future<Response> getCourses(Dio dio, String token) async {
    final Response response = await dio.get(
      'https://api.jsonbin.io/b/6082274da2213a0c14294edf',
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'secret-key': '$token'
        },
      ),
    );

    return response;
  }

  Future<Response> getCourseDetails(
      Dio dio, String token, String courseId) async {
    final Response response = await dio.get(
      'https://api.jsonbin.io/b/60863e03c7df3422f7fdbc2f/1',
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          'secret-key': '$token'
        },
      ),
    );

    return response;
  }
}
