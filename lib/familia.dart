import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salamanca/characters/lalo/lalo.dart';
import 'package:salamanca/characters/saul/saul.dart';
import 'package:salamanca/characters/tuco/tuco.dart';
import 'package:salamanca/characters/twins/twins.dart';
import 'characters/hector/hector.dart';

class VillianWidget extends StatelessWidget {
  const VillianWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarouselSlider(
        options: CarouselOptions(height: MediaQuery.of(context).size.height),
        items: [Hector(), Tuco(), Twins(), Lalo()],
      ),
      floatingActionButton: IconButton(
        icon: Image.asset("assets/image/saul.png"),
        iconSize: MediaQuery.of(context).size.width / 4.5,
        onPressed: () {
          // Add your onPressed code here!
          log("Pressed Saul");
          Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context) => Saul()));
        },
      ),
    );
  }
}
