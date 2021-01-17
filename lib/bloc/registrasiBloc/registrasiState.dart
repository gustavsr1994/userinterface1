import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/models/UserModel.dart';

abstract class RegistrasiState extends Equatable{

}

class RegistrasiInitialState extends RegistrasiState{
  @override
  List<Object> get props => [];
}

class RegistrasiLoadingState extends RegistrasiState{
  @override
  List<Object> get props => [];
}

class RegistrasiLoadedState extends RegistrasiState{
  final UserModel userModel;
  final BuildContext context;
  
  RegistrasiLoadedState({@required this.userModel, @required this.context});

  @override
  List<Object> get props => [userModel];
}

class RegistrasiErrorState extends RegistrasiState{
  String message;
  RegistrasiErrorState({@required this.message});
  @override
  List<Object> get props => [message];
}