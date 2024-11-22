import 'package:flutter/material.dart';
import 'menu.dart';  // Import the menu.dart file here

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuScreen(),  // Set MenuScreen as the home screen
    );
  }
}
