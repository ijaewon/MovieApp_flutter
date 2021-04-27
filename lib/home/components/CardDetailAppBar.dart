import 'package:flutter/material.dart';

class CardDetailAppBar extends StatelessWidget {
  const CardDetailAppBar({
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
