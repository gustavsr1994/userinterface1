import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/models/UserModel.dart';
import 'package:flutter_maps/repository/LoginRepository.dart';
import 'package:flutter_maps/services/AuthMethode.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'loginEvent.dart';
import 'loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc(@required this.loginRepository) : super(null);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    UserModel model;
    if (event is FetchLoginEvent) {
      yield LoginLoadingState();
      try {
        if (event.typeLogin == 0) {
          AuthMethode authMethode = new AuthMethode();
          model = await authMethode.signInAuth(event.username, event.password);
        } else if (event.typeLogin == 1) {
          AuthMethode authMethode = new AuthMethode();
          model = await authMethode.signInwithGoogle();
        }

        if (model.userId != null) {
          RouteAdapter().routeNavigator(event.context, MainMenu());
          yield LoginLoadedState(userModel: model, context: event.context);
        } else {
          yield LoginErrorState(message: model.message);
        }
      } catch (e) {
        yield LoginErrorState(message: e.toString());
      }
    }
  }
}
