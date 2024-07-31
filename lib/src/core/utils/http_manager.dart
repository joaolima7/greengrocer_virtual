import 'package:dio/dio.dart';

class HttpMethods {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'applications/json',
        'X-Parse-Application-Id': '0D7WCmowHaQAqQ7vA2n6wxkQAgTcatEiS34SrVBM',
        'X-Parse-REST-API-Key': 'eeMj43coozK4keedzX5M3YoVXs0raC6fkdqoJHP7',
      });
    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );

      return response.data;
    } on DioException catch (error) {
      return error.response?.data ?? {};
    } catch (e) {
      return {};
    }
  }
}
