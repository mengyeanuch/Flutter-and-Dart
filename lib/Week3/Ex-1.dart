import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Center(
          child: Text(
            "Hello my name is Mengyean!",
            style: TextStyle(
              color: Colors.orange , fontSize: 50
            ),
          ),
        )
      ),
    ),
  );
}
