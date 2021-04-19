import 'package:flutter/material.dart';
import 'package:movie_flutter/home/screen/UpComming_screen.dart';
import 'package:movie_flutter/home/screen/home_screen.dart';
import 'package:movie_flutter/home/screen/search_screen.dart';
import 'package:movie_flutter/sizeConfig.dart';

// class CustomNavBar extends StatefulWidget {
//   const CustomNavBar({
//     Key key,
//   }) : super(key: key);

//   @override
//   _CustomNavBarState createState() => _CustomNavBarState();
// }

// int selectedIdx = 0, preSelectedIdx = 0;

// class _CustomNavBarState extends State<CustomNavBar> {
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double defaultSize = SizeConfig.defaultSize;

//     return Container(
//       color: Colors.black,
//       height: defaultSize * 7,
//       child: Padding(
//         padding: EdgeInsets.all(defaultSize),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             NavItem(
//               defaultSize: defaultSize,
//               press: () {
//                 selectedIdx = 0;
//                 if (selectedIdx != preSelectedIdx) {
//                   preSelectedIdx = selectedIdx;
//                   return Navigator.pushNamed(context, '/');
//                 }
//               },
//               icon: Icons.home,
//             ),
//             NavItem(
//               defaultSize: defaultSize,
//               press: () {
//                 selectedIdx = 1;
//                 if (selectedIdx != preSelectedIdx) {
//                   preSelectedIdx = selectedIdx;
//                   return Navigator.pushNamed(context, '/second');
//                 }
//               },
//               icon: Icons.web_asset,
//             ),
//             NavItem(
//               defaultSize: defaultSize,
//               press: () {
//                 selectedIdx = 2;
//                 if (selectedIdx != preSelectedIdx) {
//                   preSelectedIdx = selectedIdx;
//                   return Navigator.pushNamed(context, '/third');
//                 }
//               },
//               icon: Icons.search,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NavItem extends StatelessWidget {
//   const NavItem({
//     Key key,
//     @required this.defaultSize,
//     @required this.press,
//     @required this.icon,
//   }) : super(key: key);

//   final double defaultSize;
//   final GestureTapCallback press;
//   final icon;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//           child: Icon(
//         icon,
//         color: Colors.white70,
//         size: defaultSize * 3.5,
//       )),
//     );
//   }
// }

class HomeTabBar extends StatefulWidget {
  @override
  _HomeTabBarState createState() => _HomeTabBarState();
}

class _HomeTabBarState extends State<HomeTabBar>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      body: TabBarView(
          controller: controller, // 컨트롤러 연결
          physics: NeverScrollableScrollPhysics(),
          children: [HomeScreen(), UpCommingScreen(), SearchScreen()]),
      bottomNavigationBar: Container(
        height: defaultSize * 10,
        child: TabBar(controller: controller, // 컨트롤러 연결
            tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  size: defaultSize * 3,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.update,
                  size: defaultSize * 3,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  size: defaultSize * 3,
                ),
              )
            ]),
      ),
    );
  }
}
