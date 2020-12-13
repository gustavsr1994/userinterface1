import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/menuProduct.dart';

class CardMainMenuAdapter extends StatelessWidget {
  String title;
  IconData nameIcon;
  int index;
  CardMainMenuAdapter({this.title, this.nameIcon, this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 0) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        } else if (index == 1) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        } else if (index == 2) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        } else if (index == 3) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        } else if (index == 4) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        } else if (index == 5) {
          Navigator.pushReplacement(context, _createRoute(MenuProduct()));
        }
      },
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

  Route _createRoute(var nameClass) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nameClass,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
