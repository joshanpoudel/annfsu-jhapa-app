import 'package:annfsu_app/view/splash.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.fade,
        theme: ThemeData(
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 14.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
            ),
            bodyMedium: TextStyle(
              fontSize: 12.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.normal,
            ),
            titleLarge: TextStyle(
              fontSize: 18.0,
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        home: const SplashView());
  }
}
