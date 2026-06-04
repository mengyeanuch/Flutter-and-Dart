import 'package:flutter/material.dart';


void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Container(
      
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(50),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[100],
              ),
              height: 60,
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "OOP",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.blue[300],
              ),
              height: 60,
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "Dart",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.blue[300]!, Colors.blue[900]!],
                ),
              ),
              height: 60,
              margin: const EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  "Flutter",
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
