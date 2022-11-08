import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app_get_it_injecter/cacheHelper.dart';
import 'package:test_app_get_it_injecter/pages/home.dart';
import 'package:test_app_get_it_injecter/pages/login.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _cache = getIt<CacheHelper>();
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => _cache.getBaseUrl == null
            ? const LoginScreen()
            : const HomeScreen(),
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Start'),
      ),
    );
  }
}
