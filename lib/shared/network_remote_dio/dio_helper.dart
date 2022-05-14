import 'package:dio/dio.dart';
import 'constant_end_piont.dart';

class DioHelper{

  static Dio? dio;

    static init(){
    dio = Dio(
      BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
    ),
    );
}

   Future<Response> getData({
     required String url,
    required Map<String,  dynamic> query,
}) async {
    return await dio!.get(url, queryParameters: query,);
  }
}