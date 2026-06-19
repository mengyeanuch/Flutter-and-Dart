import 'package:flutter/material.dart';
import '../../data/jokes.dart';


Color appColor = Colors.green[300] as Color;
class JokesScreen extends StatefulWidget {
  const JokesScreen({super.key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  int? favoriteJokeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes")),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          final joke = jokes[index];

          return ListTile(
            title: Text(joke.title),
            subtitle: Text(joke.description),
            trailing: IconButton(
              icon: Icon(
                favoriteJokeId == joke.id
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: favoriteJokeId == joke.id ? Colors.red : Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  favoriteJokeId = joke.id;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
