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

  Color get background => isClicked ? Colors.blue[500]! : Colors.blue[50]!;
  String get buttonText => isClicked ? "Selected" : "Not Selected";
  Color get textColor => isClicked ? Colors.white : Colors.black;

  void changeColor() {
    setState(() {
      isClicked = !isClicked;
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
