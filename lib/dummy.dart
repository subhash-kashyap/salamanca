import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:salamanca/lalo/lalo.dart';
import 'package:salamanca/tuco/tuco.dart';
import 'package:salamanca/twins/twins.dart';

import 'hector/hector.dart';

class DummyWidget extends StatelessWidget {
  const DummyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(height: MediaQuery.of(context).size.height),
        items: [Hector(), Tuco(), Twins(), Lalo()],
        // items: [1, 2, 3, 4].map((i) {
        //   return Builder(
        //     builder: (BuildContext context) {
        //       return Container(
        //           width: MediaQuery.of(context).size.width,
        //           margin: EdgeInsets.symmetric(horizontal: 5.0),
        //           decoration: BoxDecoration(color: Colors.amber),
        //           child: Hector());
        //     },
        //   );
        // }).toList(),
      ),
    );
  }
}
