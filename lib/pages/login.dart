import 'package:flutter/material.dart';
import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/pages/home.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          final cache = getIt<CacheHelper>();
          cache.setBaseUrl(value: 'https://reqres.in/api');
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()));
        },
        child: const Text('get Url'),
      )),
    );
  }
}
