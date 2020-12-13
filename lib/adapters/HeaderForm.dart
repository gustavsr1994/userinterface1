import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';

class HeaderForm extends StatelessWidget {
  String title;
  HeaderForm({this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: fontTitle,
    );
  }
}
