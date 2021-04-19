import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_flutter/components/CategoryTitle.dart';
import 'package:movie_flutter/components/MainPost.dart';
import 'package:movie_flutter/components/MovieCardScroll.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: buildAppBar(defaultSize, title: "Home"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            MainPost(
              image: movies[0]['img'],
              title: movies[0]['title'],
              description: movies[0]['description'],
              rating: movies[0]['rating'],
            ),
            CategoryTitle(
              title: "Popular Movies",
            ),
            MovieCardScroll(defaultSize: defaultSize),
            CategoryTitle(
              title: "Top Rated",
            ),
            MovieCardScroll(defaultSize: defaultSize)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(double defaultSize, {String title}) {
    return AppBar(
      title: Text(
        title,
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
