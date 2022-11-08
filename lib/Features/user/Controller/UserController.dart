import 'package:test_app_get_it_injecter/Features/user/Model/UserModel.dart';
import 'package:test_app_get_it_injecter/data/Repository/user_Repo.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class UserController {
  /*




  */
  // Repository ---------------------------------->
  final userRepository = getIt<UserRepository>();

  // Methods ------------------------------------->

  Future<List<UserModel>> getUsers() async {
    try {
      final users = await userRepository.getUserRequested();
      return users;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
