import 'package:flutter/material.dart';
import 'package:movie_flutter/models/movieModels.dart';

import 'MovieCard.dart';

class MovieCardScroll extends StatelessWidget {
  const MovieCardScroll({
    Key key,
    @required this.defaultSize,
  }) : super(key: key);

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: defaultSize * 2, top: defaultSize * 2.3),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(movies.length, (index) {
                return MovieCard(
                  movieImage: movies[index]['img'],
                  movieTitle: movies[index]['title'],
                );
              })),
        ),
      ),
    );
  }
}
