import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';

class TextChildProfile extends StatelessWidget {
  String title, value;
  TextChildProfile({this.title, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                    width: MediaQuery.of(context).size.width / 3,
                    margin: EdgeInsets.all(5),
                    child: Text(title, style: fontDescription)),
              ),
              Expanded(
                flex: 2,
                child: Container(
                    width: (MediaQuery.of(context).size.width / 2) + 20,
                    margin: EdgeInsets.all(5),
                    child: Text(value, style: fontDescription)),
              )
            ]));
  }
}
