import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_get_it_injecter/Features/user/View/Screen_AllUsers.dart';
import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/pages/login.dart';
import 'package:test_app_get_it_injecter/provider.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cache = getIt<CacheHelper>();
    final prv = Provider.of<ProviderHelper>(context);
    return Scaffold(
      appBar: AppBar(
        title: Switch.adaptive(
            value: prv.isDarkMode, onChanged: (val) => prv.setDarkMode(val)),
        actions: [
          IconButton(
              onPressed: () {
                cache.removeLoginKey();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => const LoginScreen()));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const ScreenAllUsers()));
        },
        child: const Text('Go to user'),
      )),
    );
  }
}
