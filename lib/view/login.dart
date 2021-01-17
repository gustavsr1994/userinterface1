import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/bloc/loginBloc/loginBloc.dart';
import 'package:flutter_maps/bloc/loginBloc/loginEvent.dart';
import 'package:flutter_maps/bloc/loginBloc/loginState.dart';
import 'package:flutter_maps/repository/LoginRepository.dart';
import 'package:flutter_maps/services/AuthMethode.dart';
import 'package:flutter_maps/view/loginPhone.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:flutter_maps/view/registrasi.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginBloc _loginBloc;
  AuthMethode authMethode = new AuthMethode();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();

  FocusNode _focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    _loginBloc = new LoginBloc(LoginRepositoryImpl());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: BlocBuilder<LoginBloc, LoginState>(
                cubit: _loginBloc,
                builder: (context, state) {
                  if (state is LoginLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3 - 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
                            color: colorPrimary,
                          ),
                          child:
                              Center(child: Text('Prototype', style: fontTitle)),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 3),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                              state is LoginLoadingState
                                  ? null
                                  : _loginBloc.add(FetchLoginEvent(
                                      username: _email.text,
                                      password: _password.text,
                                      typeLogin: 1,
                                      context: context));
                            },
                            child: Text(
                              'Sign In with Google',
                              style: fontButton,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                })));
  }
}
