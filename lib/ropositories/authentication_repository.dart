import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthenticationRepository {
  Dio dio;
  String url = "${DotEnv().env['BASE_URL']}/users";
  AuthenticationRepository() {
    dio = Dio();
  }

  Future<dynamic> login(Map<String, dynamic> data) async {
    try {
      var response = await dio.post("$url/login", data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
