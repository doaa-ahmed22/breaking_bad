//https://newsapi.org/v2/top-headlines?country=eg&apiKey=053283fbc7ef48bdbc3e5595f6872f1f
//base url: https://newsapi.org,
//url : v2/everything,
//queries :tesla&from=2022-02-21&sortBy=publishedAt&apiKey=053283fbc7ef48bdbc3e5595f6872f1f
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ' https://newsapi.org',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData(
      {required String url, required Map<String, dynamic> query}) async {
    return await dio?.get(url, queryParameters: query);
  }
}
