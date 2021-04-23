import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movie_flutter/home/components/CategoryTitle.dart';
import 'package:movie_flutter/home/components/MainPost.dart';
import 'package:movie_flutter/home/components/MovieCard.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String _query = """
    query Movies(\$limit: Int!, \$rating: Float!){
      movies(limit: \$limit, rating: \$rating){
        title
        rating
        medium_cover_image
        summary
      }
    }
  """;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Query(
        options: QueryOptions(
          document: gql(_query),
          variables: {'limit': 3, 'rating': 8.0},
          // pollInterval: Duration(seconds: 10),
        ),
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
          if (result.hasException) {
            return Center(
              child: Text(
                result.exception.toString(),
                style: TextStyle(color: Colors.white),
              ),
            );
          }
          final _movies = result.data["movies"];
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
                      title: _movies[0]['title'],
                      description: _movies[0]['summary'],
                      rating: _movies[0]['rating'].toString(),
                    ),
                    CategoryTitle(
                      title: "Popular Movies",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: defaultSize * 2, top: defaultSize * 2.3),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(_movies.length, (index) {
                                return MovieCard(
                                  movieImage: _movies[index]
                                      ['medium_cover_image'],
                                  movieTitle: _movies[index]['title'],
                                  rating: _movies[0]['rating'].toString(),
                                  press: () => print("Movie Card"),
                                );
                              })),
                        ),
                      ),
                    ),
                    CategoryTitle(
                      title: "Top Rated",
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: defaultSize * 2, top: defaultSize * 2.3),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(_movies.length, (index) {
                                return MovieCard(
                                  movieImage: _movies[index]
                                      ['medium_cover_image'],
                                  movieTitle: _movies[index]['title'],
                                  rating: _movies[0]['rating'].toString(),
                                  press: () => print("Movie Card"),
                                );
                              })),
                        ),
                      ),
                    ),
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
