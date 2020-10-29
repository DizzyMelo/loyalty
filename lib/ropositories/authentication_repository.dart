import 'package:dio/dio.dart';

class AuthenticationRepository {
  Dio dio;
  AuthenticationRepository() {
    dio = Dio();
  }
  login(Map<String, dynamic> data) async {}
}
