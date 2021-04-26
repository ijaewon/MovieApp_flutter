import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:movie_flutter/home/components/MainPost.dart';

class QueryMainPost extends StatelessWidget {
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
    return Query(
        options: QueryOptions(
          document: gql(_query),
          variables: {'limit': 10, 'rating': 9.5},
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
            return MainPost(
              image: _movies[0]['medium_cover_image'],
              title: _movies[0]['title'],
              description: _movies[0]['summary'],
              rating: _movies[0]['rating'].toString(),
            );
          }
        });
  }
}
