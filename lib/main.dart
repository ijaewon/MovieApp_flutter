import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'components/MyNavBar.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink("https://api.spacex.land/graphql/");

  ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(link: httpLink, cache: GraphQLCache(store: HiveStore())));

  runApp(MyApp(client: client));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const MyApp({Key key, this.client}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
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
        // routes: {
        //   '/': (context) => HomeScreen(),
        //   '/second': (context) => UpCommingScreen(),
        //   '/third': (context) => SearchScreen()
        // },
        home: HomeTabBar(),
      ),
    );
  }
}
