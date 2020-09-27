import 'package:flutter/material.dart';
import 'package:flutter_maps/view/login.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:flutter_maps/view/menuProduct.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuProduct(),
    );
  }
}
