import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/view/login.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:flutter_maps/view/menuProduct.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  String name = '';

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((preferences) {
      setState(() {
        name = preferences.getString('nameAccount');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: name == null ? LoginView() : MainMenu());
  }
}
