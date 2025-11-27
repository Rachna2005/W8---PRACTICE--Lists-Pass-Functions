import 'package:firstproject/w8_practices/EXERCISE-4/jokes.dart';
import 'package:flutter/material.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView(children: [FavoriteCard()]),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  int? favoriteIndex;

  void onFavoriteClick(int index) {
    setState(() {
      if (favoriteIndex == index) {
        favoriteIndex = null;
      } else {
        favoriteIndex = index;
      }
    });
  }

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
                for(var index = 0 ; index < favoriteJoke.length ; index++)
                    FavoriteJokes(
                    title: favoriteJoke[index].title,
                    description: favoriteJoke[index].description,
                    favorite: () => onFavoriteClick(index),
                    isFavorite: favoriteIndex == index,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteJokes extends StatelessWidget {
  const FavoriteJokes({
    super.key,
    required this.title,
    required this.description,
    required this.favorite,
    required this.isFavorite,
  });

  final String title;
  final String description;
  final VoidCallback favorite;
  final bool isFavorite;

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
                  title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(description),
              ],
            ),
          ),
          IconButton(
            onPressed: favorite,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
