import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:loyalty/ropositories/factory_repository.dart';

class AuthenticationRepository {
  Dio dio;
  String url = "${DotEnv().env['BASE_URL']}/users";
  FactoryRepository _factory;
  AuthenticationRepository() {
    dio = Dio();
    _factory = FactoryRepository('users');
  }

  Future<dynamic> login(Map<String, dynamic> data) async {
    try {
      var response = await dio.post("$url/login", data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> signup(Map<String, dynamic> data) async {
    try {
      var response = await dio.post("$url/signup", data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }

  getUser(String id) {
    return _factory.getOne(id);
  }
}
