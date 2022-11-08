import 'package:dio/dio.dart';
import 'package:test_app_get_it_injecter/data/Endpoint/endpoint.dart';
import 'package:test_app_get_it_injecter/data/Network/dio_client.dart';

class UserApi {
  final DioClient dioClient;
  UserApi(this.dioClient);

  Future<Response> getUser() async {
    try {
      final response = await dioClient.get(Endpoint.users);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
