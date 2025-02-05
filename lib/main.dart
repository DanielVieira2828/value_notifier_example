import 'package:change_notifier_state/presentation/controllers/theme_controller.dart';
import 'package:change_notifier_state/presentation/pages/my_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: themeController,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeController.isDarkTheme
                ? ThemeData.dark()
                : ThemeData.light(),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}
