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
}
