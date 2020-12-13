import 'package:flutter/material.dart';

class RouteAdapter {
  routeNavigator(BuildContext context, var classMenu) {
    Navigator.pushReplacement(context, _route(context, classMenu));
  }

  Route _route(BuildContext context, var classMenu) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => classMenu,
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