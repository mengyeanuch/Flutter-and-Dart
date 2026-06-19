import 'package:flutter/material.dart';
import '../../model/joke_model.dart';
import '../../data/jokes.dart';
import 'joke_screen.dart';

Color appColor = Colors.green[300] as Color;
class FavoriteCard extends StatefulWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: .5, color: Colors.grey)),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(widget.joke.description),
              ],
            ),
          ),
          // IconButton(
          //   onPressed: widget.onFavoritePressed,
          //   icon: Icon(
          //     widget.isFavorite ? Icons.favorite : Icons.favorite_border,
          //     color: widget.isFavorite ? Colors.red : Colors.grey,
          //   ),
          // ),
        ],
      ),
    );
  }
}
