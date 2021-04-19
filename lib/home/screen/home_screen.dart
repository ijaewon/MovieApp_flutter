import 'package:flutter/material.dart';
import 'package:movie_flutter/sizeConfig.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
      appBar: buildAppBar(defaultSize),
      body: Padding(
        padding: EdgeInsets.all(defaultSize * 2),
        child: Container(
          width: defaultSize * 17,
          height: defaultSize * 27,
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.all(defaultSize),
            child: Column(
              children: [
                Container(
                  width: defaultSize * 15,
                  height: defaultSize * 20,
                  color: Colors.blue,
                ),
                SizedBox(
                    width: defaultSize * 15,
                    child: Text(
                      "Iron man",
                      style: TextStyle(
                          color: Colors.white, fontSize: defaultSize * 1.6),
                      textAlign: TextAlign.center,
                    )),
                SizedBox(
                    width: defaultSize * 15,
                    child: Text(
                      "Iron man",
                      style: TextStyle(
                          color: Colors.white, fontSize: defaultSize * 1.6),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(double defaultSize) {
    return AppBar(
      title: Text(
        "Home",
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
