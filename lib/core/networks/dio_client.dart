import 'package:dio/dio.dart';

class DioClient {
  static Dio createDio() {
    return Dio(BaseOptions(baseUrl: 'https://rest.coincap.io/v3/'));
  }
}
