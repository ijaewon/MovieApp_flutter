import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:movie_flutter/home/screen/CardDetailScreen.dart';

import '../../sizeConfig.dart';

class MainPost extends StatelessWidget {
  const MainPost(
      {Key key,
      @required this.image,
      @required this.title,
      @required this.summary,
      @required this.rating,
      @required this.language,
      @required this.runtime})
      : super(key: key);

  final String image;
  final String title;
  final String summary;
  final String rating;
  final String language;
  final String runtime;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Stack(
      children: [
        Image.network(
          image,
          fit: BoxFit.cover,
          width: SizeConfig.screenWidth,
          height: defaultSize * 30,
          alignment: Alignment.lerp(Alignment.topLeft, Alignment.center, 1),
        ),
        Container(
          width: SizeConfig.screenWidth,
          height: defaultSize * 30,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),
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
              Container(
                width: defaultSize * 15,
                child: Column(
                  children: [
                    RichText(
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                              text: title,
                              style: TextStyle(
                                  fontSize: defaultSize * 2.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ])),
                    SizedBox(
                      height: defaultSize,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: rating, style: TextStyle(color: Colors.white)),
                    ])),
                    SizedBox(
                      height: defaultSize,
                    ),
                    RichText(
                        textAlign: TextAlign.center,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(children: [
                          TextSpan(
                              text: summary,
                              style: TextStyle(color: Colors.white)),
                        ])),
                    SizedBox(
                      height: defaultSize,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 0, right: defaultSize * 3.7),
                      child: ElevatedButton(
                        child: Text('View detail'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CardScreen(
                                        image: image,
                                        title: title,
                                        rating: rating,
                                        summary: summary,
                                        languages: language,
                                        runtime: runtime,
                                      )));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.red;
                              return Colors.redAccent;
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
