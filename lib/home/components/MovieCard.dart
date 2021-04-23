import 'dart:ffi';

import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
      {Key key,
      @required this.movieImage,
      @required this.movieTitle,
      @required this.rating,
      @required this.press})
      : super(key: key);

  final String movieImage;
  final String movieTitle;
  final Function press;
  final String rating;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.only(right: defaultSize * 3),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: press,
        child: Container(
          width: defaultSize * 17,
          // height: defaultSize * 27,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultSize),
            color: Colors.black26,
          ),
          child: Column(
            children: [
              Container(
                width: SizeConfig.screenWidth,
                height: defaultSize * 20,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(movieImage), fit: BoxFit.cover),
                    borderRadius:
                        BorderRadius.all(Radius.circular(defaultSize * 1.2))),
              ),
              SizedBox(
                height: defaultSize * 0.3,
              ),
              SizedBox(
                  width: defaultSize * 15,
                  child: Text(
                    movieTitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: defaultSize * 1.7,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  )),
              SizedBox(
                height: defaultSize * 0.28,
              ),
              SizedBox(
                  width: defaultSize * 15,
                  child: Text(
                    "$rating",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: defaultSize * 1.4,
                    ),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
