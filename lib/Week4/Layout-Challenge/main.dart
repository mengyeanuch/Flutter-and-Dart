import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(height: 100, color: Colors.white),
            Container(
              height: 400,
              // width: double.infinity,
              color: Colors.lightBlue[200],
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded( child: Container(color: Colors.green[100])),

                  Container(width: 100, color: Colors.pink[100]),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.lightBlue[100])),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.lightBlue[100])),
                  const SizedBox(width: 20),
                  Expanded(child: Container(color: Colors.lightBlue[100])),
                ],
              ),
            ),
            Container(height: 20, color: Colors.white),
            Expanded(
              // child: Container(width: double.infinity, color: Colors.pink[100]),
              child: Container( color: Colors.pink[100]),
            ),
          ],
        ),
      ),
    ),
  );
}
