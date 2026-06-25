import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final BoxDecoration textDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
  );

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  final TextEditingController _tempController = TextEditingController();
  double temp = 0;
  String? errorMessage;
  void convertToFarenheit() {
    setState(() {
    if (_tempController.text.isEmpty) {
      errorMessage = null;
      temp = 0;
      return;
    }
      double? celsius = double.tryParse(_tempController.text);
      if (celsius != null) {
        temp = (celsius * 1.8) + 32;
        errorMessage = null;
      } else {
        errorMessage = "Please enter a valid number";
      }
    });
  }
  
  @override
  void dispose() {
    _tempController.dispose();
    super.dispose();
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
              onChanged: (_) => convertToFarenheit(),
              decoration: inputDecoration.copyWith(errorText: errorMessage),
              controller: _tempController,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: textDecoration,
              child: Text("${temp.toStringAsFixed(2)}°F"),
            ),
          ],
        ),
      ),
    );
  }
}
