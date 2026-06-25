import 'package:flutter/material.dart';

class ByebyeScreen extends StatelessWidget {
  const ByebyeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          const Text(
            "Bye Bye !",
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ],
      ),
    );
    
  }
}