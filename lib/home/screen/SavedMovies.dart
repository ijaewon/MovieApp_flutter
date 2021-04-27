import 'package:flutter/material.dart';
import 'package:movie_flutter/components/MyNavBar.dart';
import 'package:movie_flutter/home/components/CardDetailAppBar.dart';
import 'package:movie_flutter/sizeConfig.dart';

class SavedMoive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double defaultSize = SizeConfig.defaultSize;

    return Scaffold(
        // bottomNavigationBar: CustomNavBar(),
        body: Column(
      children: [CardDetailAppBar(defaultSize: defaultSize, title: "")],
    ));
  }
}
