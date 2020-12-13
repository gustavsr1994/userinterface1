import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/network_image.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/mainMenu.dart';

class DetailProduct extends StatefulWidget {
  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrool) {
              return <Widget>[
                SliverAppBar(
                  leading: BackButton(
                    color: colorAccent,
                    onPressed: () {
                      Navigator.pushReplacement(context, _createRoute());
                    },
                  ),
                  backgroundColor: colorPrimary,
                  expandedHeight: MediaQuery.of(context).size.height / 3,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      'Lawless Lemmy',
                      style: fontTitle,
                    ),
                    background: PNetworkImage(
                      "https://lawlessjakarta.com/wp-content/uploads/2017/09/Lawless_burgerbar_3.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ];
            },
            body: SingleChildScrollView(
              child:
              Column(
                children: <Widget>[
                  Text(
                    "Test",
                    style: fontDescription,
                  ),
                ],
              ),
            )));
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MainMenu(),
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
