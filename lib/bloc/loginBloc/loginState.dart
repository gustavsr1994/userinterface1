

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/models/UserModel.dart';

abstract class LoginState extends Equatable{

}

class LoginInitialState extends LoginState{
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState{
  @override
  List<Object> get props => [];
}

class LoginLoadedState extends LoginState{
  final UserModel userModel;
  final BuildContext context;
  
  LoginLoadedState({@required this.userModel, @required this.context});

  @override
  List<Object> get props => [userModel];
}

class LoginErrorState extends LoginState{
  String message;
  LoginErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}