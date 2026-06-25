import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback onClosePressed;
  final VoidCallback onBackPressed;
  const TemperatureScreen({super.key, required this.onClosePressed, required this.onBackPressed});
  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  double temp = 0;
  void convertToFarenheit(String value) {
    setState(() {
      temp = (double.parse(value) * 1.8) + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:"),
            const SizedBox(height: 10),
            TextField(
              onChanged: (temp) => convertToFarenheit(temp),
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text("${temp.toStringAsFixed(2)}°F"),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: widget.onBackPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: widget.onClosePressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(width: 1.0, color: Colors.white),
              ),
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
