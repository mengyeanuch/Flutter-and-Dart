import 'package:flutter/material.dart';
import 'temperature_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool started = false;

  @override
  Widget build(BuildContext context) {
    if (started) {
      return TemperatureScreen();
    }
    // Widget build(BuildContext context) {
    //   return started
    //       ? const TemperatureScreen()
    //       : Center(
    //           child: OutlinedButton(
    //             onPressed: () {
    //               setState(() {
    //                 started = true;
    //               });
    //             },
    //             child: const Text("Start to convert"),
    //           ),
    //         );
    // }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
          ),
          const Text(
            "Welcome !",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              setState(() {
                started = true;
              });
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            child: Text(
              'Start to convert',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
