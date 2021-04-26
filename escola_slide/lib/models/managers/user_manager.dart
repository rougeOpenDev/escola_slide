import 'package:flutter/material.dart';

import 'package:dio/dio.dart';

import 'dart:developer';

import 'package:escola_slide/models/entitys/user_entitys.dart';
import 'package:escola_slide/apis/api_user.dart';

class UserManager extends ChangeNotifier {
  UserEntity _userData;
  // final storage = const FlutterSecureStorage();
  final ApiUser endpointUser = ApiUser();
  bool _loading = false;

  UserManager() {
    getUserData();
  }

  Future<void> getUserData() async {
    log('Getting user data . . .');
    loading = true;
    final Dio dio = Dio();
    // final token = await storage.read(key: 'token');
    final response = await endpointUser.getUserData(
        dio, '\$2b\$10\$BZqF.T5fzqMKdPBpavvzAOoSGEh7GTRhLyJmhm3x.1VBNGWkmtEjq');

    if (response.statusCode == 200) {
      _userData = UserEntity.fromJson(response.data);
    } else {}

    notifyListeners();
    loading = false;
  }

  bool get loading => _loading;
  UserEntity get user => _userData;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<String> authenticate({
    @required String username,
    @required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore/keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}
