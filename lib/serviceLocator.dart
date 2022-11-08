import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app_get_it_injecter/Features/user/Controller/UserController.dart';
import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/data/Api/user_Api.dart';
import 'package:test_app_get_it_injecter/data/Network/dio_client.dart';
import 'package:test_app_get_it_injecter/data/Repository/user_Repo.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  final shared = await SharedPreferences.getInstance();

  getIt.registerSingleton<CacheHelper>(CacheHelper(shared: shared));

  // Networking
  getIt.registerSingleton<DioClient>(DioClient());
  getIt.registerSingleton<UserApi>(UserApi(getIt<DioClient>()));
  getIt.registerSingleton<UserRepository>(UserRepository(getIt<UserApi>()));

  // Controller
  getIt.registerSingleton<UserController>(UserController());
}
