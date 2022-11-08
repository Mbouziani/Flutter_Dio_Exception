import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class Endpoint {
  //
  static String baseUrl = getIt<CacheHelper>().getBaseUrl!;

  // static const String allProducts = '/Products/All';

  // static const String allAgents = '/Agents/All';

  static const String users = '/users';

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;
}
