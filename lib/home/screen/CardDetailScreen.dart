import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../../sizeConfig.dart';

class CardScreen extends StatelessWidget {
  final String image;
  final String summary;
  final String title;
  final String languages;
  final String runtime;
  final String rating;

  const CardScreen(
      {Key key,
      @required this.image,
      @required this.summary,
      @required this.title,
      @required this.languages,
      @required this.runtime,
      @required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            BuildCardAppBar(defaultSize: defaultSize, title: title),
            _buildMainPost(defaultSize),
            CardDetailTitle(
              defaultSize: defaultSize,
              title: "Summary",
            ),
            SizedBox(
              height: defaultSize,
            ),
            Container(
              width: defaultSize * 38,
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: summary,
                    style: TextStyle(
                        color: Colors.white, fontSize: defaultSize * 1.3))
              ])),
            ),
            SizedBox(
              height: defaultSize * 2,
            ),
            CardDetailTitle(defaultSize: defaultSize, title: "Langauge"),
            SizedBox(
              height: defaultSize,
            ),
            Padding(
              padding: EdgeInsets.only(right: defaultSize * 36),
              child: Text(
                languages,
                style:
                    TextStyle(color: Colors.white, fontSize: defaultSize * 1.3),
              ),
            ),
            CardDetailTitle(defaultSize: defaultSize, title: "Runtime"),
            SizedBox(
              height: defaultSize,
            ),
            Padding(
              padding: EdgeInsets.only(right: defaultSize * 35),
              child: Text(
                runtime,
                style:
                    TextStyle(color: Colors.white, fontSize: defaultSize * 1.3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Stack _buildMainPost(double defaultSize) {
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          width: SizeConfig.screenWidth,
          height: defaultSize * 30,
          alignment: Alignment.lerp(Alignment.topLeft, Alignment.center, 1),
        ),
        Positioned(
          left: defaultSize * 3.3,
          top: defaultSize * 5,
          child: Row(
            children: [
              Container(
                width: defaultSize * 13.3,
                height: defaultSize * 17.5,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: defaultSize * 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: defaultSize * 14, right: defaultSize * 2),
                child: Container(
                  width: defaultSize * 15,
                  child: Column(
                    children: [
                      RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(children: [
                            TextSpan(
                                text: title,
                                style: TextStyle(
                                    fontSize: defaultSize * 2.2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ])),
                      SizedBox(
                        height: defaultSize,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: defaultSize * 5),
                        child: Text(
                          rating,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: defaultSize,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CardDetailTitle extends StatelessWidget {
  const CardDetailTitle({
    Key key,
    @required this.defaultSize,
    @required this.title,
  }) : super(key: key);

  final double defaultSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize * 2, right: defaultSize * 31),
      child: Container(
        height: defaultSize * 3,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: defaultSize * 1.7,
          ),
        ),
      ),
    );
  }
}

class BuildCardAppBar extends StatelessWidget {
  const BuildCardAppBar({
    Key key,
    @required this.defaultSize,
    @required this.title,
  }) : super(key: key);

  final double defaultSize;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultSize),
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          SizedBox(width: defaultSize * 2),
          Container(
            width: defaultSize * 29,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: defaultSize * 2,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
