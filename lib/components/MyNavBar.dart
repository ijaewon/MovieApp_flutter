import 'package:flutter/material.dart';
import 'package:movie_flutter/sizeConfig.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    int selectedIdx, preSelectedIdx;

    return Container(
      color: Colors.black,
      height: defaultSize * 7,
      child: Padding(
        padding: EdgeInsets.all(defaultSize),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            NavItem(
              defaultSize: defaultSize,
              press: () {
                return Navigator.pushNamed(context, '/');
              },
              icon: Icons.home,
            ),
            NavItem(
              defaultSize: defaultSize,
              press: () {
                return Navigator.pushNamed(context, '/second');
              },
              icon: Icons.web_asset,
            ),
            NavItem(
              defaultSize: defaultSize,
              press: () {
                return Navigator.pushNamed(context, '/third');
              },
              icon: Icons.search,
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    Key key,
    @required this.defaultSize,
    @required this.press,
    @required this.icon,
  }) : super(key: key);

  final double defaultSize;
  final GestureTapCallback press;
  final icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
          child: Icon(
        icon,
        color: Colors.white70,
        size: defaultSize * 3.5,
      )),
    );
  }
}
