import 'package:flutter/material.dart';

void main() {
  runApp(const ButtonApp());
}

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CustomButtons(),
                SizedBox(height: 20),
                CustomButtons(),
                SizedBox(height: 20),
                CustomButtons(),
                SizedBox(height: 20),
                CustomButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButtons extends StatefulWidget {
  const CustomButtons({super.key});

  @override
  State<CustomButtons> createState() => _CustomButtonsState();
}

class _CustomButtonsState extends State<CustomButtons> {
  bool isClicked = false;

  Color background = Colors.blue[50]!;
  Color textColor = Colors.black;
  String buttonText = "Not Selected";

  void changeColor() {
    setState(() {
      if (!isClicked) {
        background = Colors.blue[500]!;
        buttonText = "Selected";
        textColor = Colors.white;
        isClicked = true;
      } else {
        background = Colors.blue[50]!;
        buttonText = "Not Selected";
        textColor = Colors.black;
        isClicked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: changeColor,
        style: ElevatedButton.styleFrom(backgroundColor: background),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 40, color: textColor),
        ),
      ),
    );
  }
}
