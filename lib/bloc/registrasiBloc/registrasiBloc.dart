import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/bloc/registrasiBloc/registrasiEvent.dart';
import 'package:flutter_maps/bloc/registrasiBloc/registrasiState.dart';
import 'package:flutter_maps/models/UserModel.dart';
import 'package:flutter_maps/repository/LoginRepository.dart';
import 'package:flutter_maps/services/AuthMethode.dart';
import 'package:flutter_maps/view/login.dart';

class RegistrasiBloc extends Bloc<RegistrasiEvent, RegistrasiState> {
  RegistrasiBloc(RegistrasiState initialState) : super(initialState);

  @override
  Stream<RegistrasiState> mapEventToState(RegistrasiEvent event) async* {
    UserModel model;
    if (event is FetchRegistrasiEvent) {
      yield RegistrasiLoadingState();
      try {
        AuthMethode authMethode = new AuthMethode();
        model = await authMethode.signUpAuth(event.username, event.password);

        if (model.userId != null) {
          RouteAdapter().routeNavigator(event.context, LoginView());
          yield RegistrasiLoadedState(userModel: model, context: event.context);
        } else {
          yield RegistrasiErrorState(message: model.message);
        }
      } catch (e) {
        yield RegistrasiErrorState(message: e.toString());
      }
    }
  }
}
