import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/models/UserModel.dart';
import 'package:flutter_maps/repository/LoginRepository.dart';
import 'package:flutter_maps/services/AuthMethode.dart';
import 'package:flutter_maps/view/mainMenu.dart';

import 'loginEvent.dart';
import 'loginState.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginRepository;

  LoginBloc(@required this.loginRepository) : super(null);

  @override
  LoginState get initialState => LoginInitialState();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is FetchLoginEvent) {
      yield LoginLoadingState();
      try {
        AuthMethode authMethode = new AuthMethode();
        UserModel model =
            await authMethode.signInAuth(event.username, event.password);
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
