import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/bloc/loginBloc/loginBloc.dart';
import 'package:flutter_maps/bloc/loginBloc/loginEvent.dart';
import 'package:flutter_maps/bloc/loginBloc/loginState.dart';
import 'package:flutter_maps/repository/LoginRepository.dart';
import 'package:flutter_maps/services/AuthMethode.dart';

class RegitrasiView extends StatefulWidget {
  @override
  _RegitrasiViewState createState() => _RegitrasiViewState();
}

class _RegitrasiViewState extends State<RegitrasiView> {
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
                              Center(child: Text('Aplikasi Suka Suka', style: fontTitle)),
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
                              controller: _email,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colorPrimary)),
                                labelText: 'Masukkan Email',
                                labelStyle: fontEditText,
                                icon: Icon(
                                  Icons.person_outline,
                                  color: colorPrimary,
                                ),
                                hintText: 'Email',
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
                              controller: _password,
                              decoration: InputDecoration(
                                border: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colorPrimary)),
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
                        state is LoginErrorState
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 5),
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Center(
                                  child: Text(
                                    state.message,
                                    style: fontTitle,
                                  ),
                                ),
                              )
                            : SizedBox(height: 5),
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
                                      typeLogin: 0,
                                      context: context));
                            },
                            child: Text(
                              'Registration',
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
