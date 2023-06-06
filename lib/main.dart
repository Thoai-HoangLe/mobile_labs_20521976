import 'package:flutter/material.dart';
import 'package:lap5_mobiles/animation/left_transiton.dart';
import 'package:lap5_mobiles/pages/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation Example',
      theme: ThemeData(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: SlideLeftTransition(),
          },
        ),
      ),
      home: HomePage(),
    );
  }
}