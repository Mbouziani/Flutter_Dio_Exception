import 'package:dio/dio.dart';
import 'package:test_app_get_it_injecter/data/Endpoint/endpoint.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = Endpoint.baseUrl;
    options.receiveTimeout = Endpoint.receiveTimeout;
    options.connectTimeout = Endpoint.connectionTimeout;
    options.responseType = ResponseType.json;

    super.onRequest(options, handler);
  }
}
