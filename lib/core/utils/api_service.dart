// https://newsapi.org/v2/everything?q=bitcoin&apiKey=084a387cd5f64a3ea0dc927241196e9d
// https://newsapi.org/v2/everything?country=eg&category=business&apiKey=084a387cd5f64a3ea0dc927241196e9d
import 'package:dio/dio.dart';

class ApiService {

  static Dio ?dio;

  static init()
  {
    dio =Dio(BaseOptions(baseUrl: 'https://newsapi.org/',
    receiveDataWhenStatusError: true),
    );
  }

 static Future<Response<Map<String,dynamic>>> getData({required String url,required Map<String,dynamic> query}) async
 {
  return await dio!.get(url,queryParameters: query);
 }
}