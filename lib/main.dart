//ID = ram12@gmail.com
//Password = 12345

//Id = admin12@gmail.com
//Password = root12

import 'package:flutter/material.dart';
import 'package:travel_guide_app/auth/loginscreen.dart';
import 'package:travel_guide_app/screen/home_screen.dart';

void main() {
  runApp(const TravelGuide(

  ));
}

class TravelGuide extends StatelessWidget {
  const TravelGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
