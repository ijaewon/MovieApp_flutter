import 'package:flutter/material.dart';
import 'package:movie_flutter/models/movieModels.dart';

import '../../sizeConfig.dart';
import 'MovieCard.dart';

class MovieCardScroll extends StatelessWidget {
  final int length;
  final image;
  final title;

  const MovieCardScroll({
    Key key,
    @required this.length,
    @required this.image,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.only(left: defaultSize * 2, top: defaultSize * 2.3),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(length, (index) {
                return MovieCard(
                  movieImage: image,
                  movieTitle: title,
                  press: () => print("Movie Card"),
                );
              })),
        ),
      ),
    );
  }
}
