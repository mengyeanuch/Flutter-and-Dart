import 'package:flutter/material.dart';

class MyHobbies extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;

  const MyHobbies({
    super.key,
    required this.label,
    required this.icon,
    this.bgColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Container(
              padding: EdgeInsetsGeometry.only(
                right: 30,
                left: 20,
                top: 40,
                bottom: 40,
              ),
              child: Icon(icon, color: Colors.white),
            ),
            Text(label, style: TextStyle(fontSize: 24, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My Hobbies"),
          backgroundColor: Colors.white,
        ),
        body: Container(
          padding: EdgeInsetsGeometry.all(40),
          decoration: BoxDecoration(color: Colors.grey[400]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyHobbies(
                label: "Travelling",
                icon: Icons.place,
                bgColor: Colors.green,
              ),
              MyHobbies(
                label: "Skating",
                icon: Icons.skateboarding,
                bgColor: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
