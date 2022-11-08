import 'package:dio/dio.dart';
import 'package:test_app_get_it_injecter/data/Network/dio_interceptor.dart';

class DioClient {
  final Dio _dio = Dio();

  DioClient() {
    _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio => _dio;

  // Get ---------------------------------->
  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Function(int, int)? onReceiveProgress}) async {
    try {
      final response = await dio.get(url,
          queryParameters: queryParameters,
          onReceiveProgress: onReceiveProgress);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // post ---------------------------------->
  Future<Response> post(
    String url, {
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onReceiveProgress,
    Function(int, int)? onSendProgress,
    dynamic data,
  }) async {
    try {
      final response = await dio.post(
        url,
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
        onSendProgress: onSendProgress,
        data: data,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
