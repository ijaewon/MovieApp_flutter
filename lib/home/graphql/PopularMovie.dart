import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movie_flutter/home/components/MovieCard.dart';
import 'package:movie_flutter/sizeConfig.dart';

class PopularMovie extends StatelessWidget {
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
          variables: {'limit': 3, 'rating': 7.0},
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
            return Padding(
              padding: EdgeInsets.only(
                  left: defaultSize * 2, top: defaultSize * 2.3),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(_movies.length, (index) {
                        return MovieCard(
                          movieImage: _movies[index]['medium_cover_image'],
                          movieTitle: _movies[index]['title'],
                          rating: _movies[index]['rating'].toString(),
                          press: () => print("Movie Card"),
                        );
                      })),
                ),
              ),
            );
          }
        });
  }
}
