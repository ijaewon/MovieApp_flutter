import 'package:flutter/material.dart';
import 'package:movie_flutter/components/MovieCard.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: buildAppBar(defaultSize),
      body: Padding(
        padding: EdgeInsets.all(defaultSize * 2),
        child: MovieCard(
          movieImage: moive[0]['img'],
          movieTitle: moive[0]['title'],
        ),
      ),
    );
  }

  AppBar buildAppBar(double defaultSize) {
    return AppBar(
      title: Text(
        "Home",
        style: TextStyle(
          fontSize: defaultSize * 2.5,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => print("Menu"),
        iconSize: defaultSize * 3,
      ),
      backgroundColor: Colors.black,
    );
  }
}
