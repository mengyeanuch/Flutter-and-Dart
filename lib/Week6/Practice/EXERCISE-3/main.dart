import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dart/Week6/Practice/EXERCISE-3/ui/screens/byebye_screen.dart';
import 'ui/screens//temperature_screen.dart';
import 'ui/screens/welcome_screen.dart';

enum Screen { welcome, temperature, byebye }

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // bool isStarted = false;

  // void onStarted() {
  //   setState(() {
  //     isStarted = !isStarted;
  //   });
  // }

  // Widget get content {
  //   if (isStarted) {
  //     return TemperatureScreen();
  //   } else {
  //     return WelcomeScreen(onStartPressed: onStarted);
  //   }
  // }
  Screen activeScreen = Screen.welcome;
  void showTemperature() {
    setState(() {
      activeScreen = Screen.temperature;
    });
  }

  void showWelcome() {
    setState(() {
      activeScreen = Screen.welcome;
    });
  }

  void showByebye() {
    setState(() {
      activeScreen = Screen.byebye;
    });
  }

  Widget get currentScreen {
    return switch (activeScreen) {
      Screen.welcome => WelcomeScreen(onStartPressed: showTemperature),
      Screen.temperature => TemperatureScreen(onClosePressed: showByebye, onBackPressed: showWelcome),
      Screen.byebye => const ByebyeScreen(),
    };
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff16C062), Color(0xff00BCDC)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: currentScreen,
        ),
      ),
    );
  }
}

void main() {
  runApp(const TemperatureApp());
}
