import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';

class CardMainMenuAdapter extends StatelessWidget {
  String title;
  IconData nameIcon;
  int index;
  CardMainMenuAdapter({this.title, this.nameIcon, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: colorPrimary,
        elevation: 5,
        shadowColor: colorAccent,
        child: Center(
          child: Wrap(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Icon(
                      nameIcon,
                      color: colorAccent,
                    ),
                  ),
                  Text(
                    title,
                    style: fontButton,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
