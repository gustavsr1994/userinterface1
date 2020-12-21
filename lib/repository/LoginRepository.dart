import 'package:flutter/material.dart';
import 'package:flutter_maps/models/UserModel.dart';

abstract class LoginRepository {
  Future<UserModel> userLogin(
      {@required String username,
      @required String password,
      @required String userToken});
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserModel> userLogin(
      {String username, String password, String userToken}) async {
    UserModel model = new UserModel();

    return model;
  }
}
