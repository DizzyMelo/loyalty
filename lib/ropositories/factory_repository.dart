import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class FactoryRepository {
  Dio dio;
  String source;
  String url;

  FactoryRepository(String source) {
    this.source = source;
    url = "${DotEnv().env['BASE_URL']}/$source";
    dio = Dio();
  }

  Future<dynamic> getAll(String params) async {
    print(url);
    try {
      var response = await dio.get(url);
      //print(response.data);
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
}
