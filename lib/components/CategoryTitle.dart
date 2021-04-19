import 'package:flutter/material.dart';
import 'package:movie_flutter/sizeConfig.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Padding(
      padding: EdgeInsets.only(top: defaultSize * 3, left: defaultSize * 2),
      child: SizedBox(
        width: SizeConfig.screenWidth,
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: defaultSize * 2.3,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
