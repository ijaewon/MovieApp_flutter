import 'package:flutter/material.dart';
import 'package:movie_flutter/components/MyNavBar.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      body: Text(
        "Search",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
