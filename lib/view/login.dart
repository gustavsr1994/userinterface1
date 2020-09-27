import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/mainMenu.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _controller = new TextEditingController();
  FocusNode _focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height / 3 - 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(100)),
                color: colorPrimary,
              ),
              child: Center(child: Text('Test : 1', style: fontTitle)),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: colorPrimary,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(90),
                  )),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                  style: fontEditText,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorPrimary)),
                    labelText: 'Masukkan Name',
                    labelStyle: fontEditText,
                    icon: Icon(
                      Icons.person_outline,
                      color: colorPrimary,
                    ),
                    hintText: 'Name',
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: colorPrimary,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(90),
                  )),
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                  style: fontEditText,
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: colorPrimary)),
                    labelText: 'Masukkan Password',
                    labelStyle: fontEditText,
                    icon: Icon(
                      Icons.lock,
                      color: colorPrimary,
                    ),
                    hintText: 'Password',
                  )),
            ),
            //give condition if error sizedbox = 30 else sizedbox = 30
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  'Message Error',
                  style: fontTitle,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: colorPrimary,
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: colorPrimary,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(90),
                  )),
              child: FlatButton(
                onPressed: () {
                  Navigator.pushReplacement(context, _createRoute());
                },
                child: Text(
                  'Login',
                  style: fontButton,
                ),
              ),
            )
          ],
        ),
      ),
    );
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
