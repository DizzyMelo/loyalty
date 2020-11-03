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
    try {
      var response = await dio.get('$url/$params');

      return response.data;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> create(Map<String, dynamic> data) async {
    try {
      var response = await dio.post(url, data: data);
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
