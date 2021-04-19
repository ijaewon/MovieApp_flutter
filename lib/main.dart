import 'package:flutter/material.dart';
import 'package:movie_flutter/home/screen/home_screen.dart';
import 'package:movie_flutter/models/movieModels.dart';
import 'package:movie_flutter/sizeConfig.dart';

import 'home/screen/UpComming_screen.dart';
import 'home/screen/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moive App',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black),
      routes: {
        '/': (context) => HomeScreen(),
        '/second': (context) => UpCommingScreen(),
        '/third': (context) => SearchScreen()
      },
    );
  }
}



// class HomeTabBar extends StatefulWidget {
//   @override
//   _HomeTabBarState createState() => _HomeTabBarState();
// }

// class _HomeTabBarState extends State<HomeTabBar>
//     with SingleTickerProviderStateMixin {
//   TabController controller;

//   @override
//   void initState() {
//     super.initState();
//     controller = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double defaultSize = SizeConfig.defaultSize;
//     return Scaffold(
//       body: TabBarView(controller: controller, // 컨트롤러 연결
//           children: [HomeScreen(), UpCommingScreen(), SearchScreen()]),
//       bottomNavigationBar: Container(
//         height: defaultSize * 10,
//         child: TabBar(controller: controller, // 컨트롤러 연결
//             tabs: [
//               Tab(
//                 icon: Icon(
//                   Icons.home,
//                   size: defaultSize * 3,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.update,
//                   size: defaultSize * 3,
//                 ),
//               ),
//               Tab(
//                 icon: Icon(
//                   Icons.search,
//                   size: defaultSize * 3,
//                 ),
//               )
//             ]),
//       ),
//     );
//   }
// }
