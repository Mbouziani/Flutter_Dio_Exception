import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app_get_it_injecter/pages/start.dart';
import 'package:test_app_get_it_injecter/provider.dart';
import 'package:test_app_get_it_injecter/serviceLocator.dart';
import 'package:test_app_get_it_injecter/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderHelper>(
      create: (context) => ProviderHelper(),
      builder: (context, child) {
        final prv = Provider.of<ProviderHelper>(context);
        return MaterialApp(
          themeMode: prv.isDarkMode ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeHelper.darkMode,
          home: const StartScreen(),
        );
      },
    );
  }
}
