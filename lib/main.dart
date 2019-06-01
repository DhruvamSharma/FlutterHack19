import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hack/screens/homeScreens/homePage.dart';
import 'package:flutter_hack/themes/homeTheme/theme1.dart';


void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        runApp(MainActivity());
  });
}

class MainActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Community App",
      debugShowCheckedModeBanner: false,
      theme: buildThemeData(),
      home: HomePage(),
    );
  }
}
