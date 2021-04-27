import 'package:flutter/material.dart';
import 'package:movie_flutter/components/MyNavBar.dart';
import 'package:movie_flutter/home/components/CardDetailAppBar.dart';

import '../../sizeConfig.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return SafeArea(
      child: Scaffold(
          // bottomNavigationBar: CustomNavBar(),
          body: Column(
        children: [
          _buildAppBar(defaultSize),
          Container(
            width: SizeConfig.screenWidth,
            height: defaultSize * 5.1,
            color: Colors.grey[600],
            child: Padding(
              padding: EdgeInsets.only(left: defaultSize * 2),
              child: Row(
                children: [
                  SizedBox(
                    width: defaultSize,
                    child: Icon(
                      Icons.search,
                      color: Colors.white60,
                      size: defaultSize * 3,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: defaultSize * 3),
                    child: Container(
                      width: defaultSize * 33,
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white70, fontSize: defaultSize * 2),
                        decoration:
                            InputDecoration(hintText: "프로그램, 영화, 장르 등을 검색"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Padding _buildAppBar(double defaultSize) {
    return Padding(
      padding:
          EdgeInsets.only(right: defaultSize * 31, bottom: defaultSize * 1.5),
      child: Container(
        child: Text(
          "Search",
          style: TextStyle(
              color: Colors.white,
              fontSize: defaultSize * 2,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
