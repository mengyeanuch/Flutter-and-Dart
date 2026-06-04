import 'package:flutter/material.dart';

enum Location {
  phnompenh(
    label: "PhnomPenh",
    tempRange: "Min 10.0°C\nMax 30.0°",
    temperature: "12.2°C",
    image: "assets/ex4/cloudy.png",
    bg: [
      Color.fromARGB(255, 238, 168, 255),
      Color.fromARGB(255, 129, 55, 224),
    ],
  ),
  paris(
    label: "Paris",
    tempRange: "Min 10.0°C\nMax 40.0°",
    temperature: "22.2°C",
    image: "assets/ex4/sunnyCloudy.png",
    bg: [
      Color.fromARGB(255, 161, 219, 107),
      Color.fromARGB(255, 102, 255, 31),
    ],
  ),
  rome(
    label: "Rome",
    tempRange: "Min 10.0°C\nMax 40.0°",
    temperature: "45.2°C",
    image: "assets/ex4/sunny.png",
    bg: [
      Color.fromARGB(255, 255, 33, 52),
      Color.fromARGB(255, 255, 16, 16),
    ],
  ),
  toulouse(
    label: "Toulouse",
    tempRange: "Min 10.0°C\nMax 40.0°",
    temperature: "45.2°C",
    image: "assets/ex4/veryCloudy.png",
    bg: [
      Color.fromARGB(255, 247, 177, 27),
      Color.fromARGB(255, 255, 194, 63),
    ],
  );

  final String label;
  final String tempRange;
  final String temperature;
  final String image;
  final List<Color> bg;

  const Location({
    required this.label,
    required this.tempRange,
    required this.image,
    required this.temperature,
    required this.bg,
  });
}

class WeatherCard extends StatelessWidget {
  final Location location;

  const WeatherCard({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      elevation: 10,
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: AlignmentGeometry.centerRight,
            colors: location.bg,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -20,
              right: -20,
              child: ClipOval(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: AlignmentGeometry.centerRight,
                      colors: location.bg,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(location.image),
              ),
              trailing: Text(
                location.temperature,
                style: TextStyle(fontSize: 36, color: Colors.white),
              ),
              title: Text(
                location.label,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                location.tempRange,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Weather App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 10),
          ],
          backgroundColor: Colors.blue[200],
        ),
        body: Container(
          padding: EdgeInsets.all(60),
          child: Center(
            child: Column(
              children: [
                WeatherCard(location: Location.phnompenh),
                SizedBox(height: 15),
                WeatherCard(location: Location.paris),
                SizedBox(height: 15),
                WeatherCard(location: Location.rome),
                SizedBox(height: 15),
                WeatherCard(location: Location.toulouse),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
