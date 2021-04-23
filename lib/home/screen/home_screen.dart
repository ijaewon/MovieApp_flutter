import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movie_flutter/home/components/CategoryTitle.dart';
import 'package:movie_flutter/home/components/MainPost.dart';
import 'package:movie_flutter/home/components/MovieCardScroll.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _query = """
    query users {
    users {
      id
      name
      rocket
      twitter
    }
  }
  """;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Query(
        options: QueryOptions(document: gql(_query)),
        builder: (
          QueryResult result, {
          VoidCallback refetch,
          FetchMore fetchMore,
        }) {
          if (result.isLoading) {
            return Container(
              child: Center(
                child: Text("Loading"),
              ),
            );
          }
          // final _movies = result.data["movies"];
          final _movies = result.data["users"];
          if (_movies == null || _movies.isEmpty) {
            return Container(
              child: Center(
                child: Text("No movies"),
              ),
            );
          } else {
            return Scaffold(
              // bottomNavigationBar: CustomNavBar(),
              appBar: buildAppBar(defaultSize, title: "Home"),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    MainPost(
                      image: movies[0]['medium_cover_image'],
                      title: _movies[0]['name'],
                      description: movies[0]['summary'],
                      rating: movies[0]['rating'],
                    ),
                    CategoryTitle(
                      title: "Popular Movies",
                    ),
                    MovieCardScroll(
                      image: movies[0]['medium_cover_image'],
                      title: _movies[0]['name'],
                      length: movies.length,
                    ),
                    CategoryTitle(
                      title: "Top Rated",
                    ),
                    MovieCardScroll(
                      image: movies[0]['medium_cover_image'],
                      title: _movies[0]['name'],
                      length: movies.length,
                    )
                  ],
                ),
              ),
            );
          }
        });
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
