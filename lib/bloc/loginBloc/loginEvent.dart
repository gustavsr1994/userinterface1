import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class LoginEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchLoginEvent extends LoginEvent{
  final String username;
  final String password;
  final BuildContext context;

  FetchLoginEvent({@required this.username, @required this.password, @required this.context});

  @override
  List<Object> get props => [username, password];
}