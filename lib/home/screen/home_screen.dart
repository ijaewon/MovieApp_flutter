import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movie_flutter/home/components/CategoryTitle.dart';
import 'package:movie_flutter/home/components/MainPost.dart';
import 'package:movie_flutter/home/components/MovieCard.dart';
import 'package:movie_flutter/home/graphql/PopularMovie.dart';
import 'package:movie_flutter/home/graphql/QueryMainPost.dart';
import 'package:movie_flutter/home/graphql/TopRated.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      // bottomNavigationBar: CustomNavBar(),
      appBar: buildAppBar(defaultSize, title: "Home"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            QueryMainPost(),
            CategoryTitle(
              title: "Popular Movies",
            ),
            PopularMovie(),
            CategoryTitle(
              title: "Top Rated",
            ),
            TopRatedMovie()
          ],
        ),
      ),
    );
  }

  buildAppBar(double defaultSize, {String title}) {
    AppBar(
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
