import 'package:flutter/material.dart';

import 'onboard_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: OnBoardScreen(),
    );
  }
}

