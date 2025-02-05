import 'package:change_notifier_state/main.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChangeNotifier"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Trocar tema do app"),
            ValueListenableBuilder(
                valueListenable: themeController,
                builder: (contex, value, child) {
                  return Switch(
                      value: value,
                      onChanged: (value) {
                        themeController.changeTheme();
                      });
                })
          ],
        ),
      ),
    );
  }
}
