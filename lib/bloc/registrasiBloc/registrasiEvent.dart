import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RegistrasiEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchRegistrasiEvent extends RegistrasiEvent{
  final String username;
  final String password;
  final BuildContext context;

  FetchRegistrasiEvent({@required this.username, @required this.password, @required this.context});

  @override
  List<Object> get props => [username, password];
}