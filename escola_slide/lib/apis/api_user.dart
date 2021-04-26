import 'package:dio/dio.dart';

class ApiUser {
  Future<Response> getUserData(Dio dio, String token) async {
    final Response response = await dio.get(
      'https://api.jsonbin.io/b/60862019c7df3422f7fdab80',
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
