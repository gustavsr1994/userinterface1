import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/view/aboutUs.dart';
import 'package:flutter_maps/view/detailProduct.dart';
import 'package:flutter_maps/view/login.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:flutter_maps/view/mapsView.dart';
import 'package:flutter_maps/view/menuProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginView()
        //DetailProduct()
        // AboutUs()
        //MapsView()
        );
  }
}
