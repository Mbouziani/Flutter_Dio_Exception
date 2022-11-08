import 'package:dio/dio.dart';
import 'package:test_app_get_it_injecter/Features/user/Model/UserModel.dart';
import 'package:test_app_get_it_injecter/data/Api/user_Api.dart';
import 'package:test_app_get_it_injecter/data/Network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  // Get ------------------------------
  Future<List<UserModel>> getUserRequested() async {
    try {
      final response = await userApi.getUser();

      final users = (response.data['data'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList();

      return users;
    } on DioError catch (e) {
      final error = DioException.fromDioError(e).toString();
      return Future.error(error.toString());
    }
  }
}
