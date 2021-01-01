import 'package:clay_containers_plus/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/CardMainMenuAdapter.dart';
import 'package:flutter_maps/assets/constant.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/login.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPrimary,
        elevation: 0,
        leading: BackButton(
          color: colorAccent,
          onPressed: () {
            Navigator.pushReplacement(context, _createRoute());
          },
        ),
        title: Text(
          'Main Menu',
          style: fontTitle,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: colorPrimary,
            height: MediaQuery.of(context).size.height / 4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    ClayContainer(
                      margin:
                          EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 90,
                      customBorderRadius: BorderRadius.all(Radius.circular(25)),
                      color: colorNetral,
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(25)),
                      //     border: Border.all(
                      //         color: colorPrimary,
                      //         style: BorderStyle.solid,
                      //         width: 1.5)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: Text(
                              'Penjualan',
                              style: fontDescription,
                            ),
                            margin: EdgeInsets.symmetric(vertical: 10),
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Expanded(
                                      flex: 1,
                                      child: Text(
                                        'September 2020',
                                        style: fontDescription,
                                      ))),
                              Spacer(),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 5),
                                  child: Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Rp 15.000.000,-',
                                        style: fontDescription,
                                      )))
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Flexible(
                        fit: FlexFit.loose,
                        child: GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: listButton
                              .map((item) => CardMainMenuAdapter(
                                    title: item['title'],
                                    nameIcon: item['image'],
                                    index: item['index'],
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
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
