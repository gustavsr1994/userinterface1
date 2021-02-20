import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/view/mainMenuView.dart';

class LoginPhoneView extends StatefulWidget {
  @override
  _LoginPhoneViewState createState() => _LoginPhoneViewState();
}

class _LoginPhoneViewState extends State<LoginPhoneView> {
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController codeOTP = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
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
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: colorPrimary)),
                labelText: 'Insert your Phone Number',
                labelStyle: fontEditText,
                icon: Icon(
                  Icons.person_outline,
                  color: colorPrimary,
                ),
                hintText: 'Phone number',
              )),
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
              String number = phoneNumberController.text;
              signInwithPhoneNumber(number);
            },
            child: Text(
              'Sign In',
              style: fontButton,
            ),
          ),
        ),
      ],
    ))));
  }

  Future<bool> signInwithPhoneNumber(String phone) {
    FirebaseAuth _authService = FirebaseAuth.instance;
    _authService.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.pop(context);
          UserCredential result =
              await _authService.signInWithCredential(credential);
          User firebaseUser = result.user;
          if (firebaseUser != null) {
            RouteAdapter().routeNavigator(context, MainMenuView());
          }
        },
        verificationFailed: (FirebaseException exception) {
          print(exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                    title: Text('Give your Code'),
                    content: TextField(
                        style: fontEditText,
                        controller: codeOTP,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: colorPrimary)),
                          labelText: 'Insert code OTP',
                          labelStyle: fontEditText,
                          icon: Icon(
                            Icons.person_outline,
                            color: colorPrimary,
                          ),
                          hintText: 'Code OTP',
                        )),
                    actions: <Widget>[
                      FlatButton(
                          child: Text('Submits', style: fontButton),
                          onPressed: () async {
                            String code = codeOTP.text;
                            AuthCredential credential =
                                PhoneAuthProvider.credential(
                                    verificationId: verificationId,
                                    smsCode: code);
                            UserCredential result = await _authService
                                .signInWithCredential(credential);
                            User firebaseUser = result.user;
                            if (firebaseUser != null) {
                              RouteAdapter()
                                  .routeNavigator(context, MainMenuView());
                            }
                          }),
                    ],
                  ));
        },
        codeAutoRetrievalTimeout: null);
  }
}
