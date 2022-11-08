import 'package:flutter/cupertino.dart';
import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class ProviderHelper extends ChangeNotifier {
  bool get isDarkMode => getIt<CacheHelper>().isDarkMode;
  void setDarkMode(bool val) =>
      {getIt<CacheHelper>().setDarkMode(value: val), notifyListeners()};
}
