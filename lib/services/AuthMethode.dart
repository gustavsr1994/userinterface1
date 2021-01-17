import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_maps/adapters/RouteAdapter.dart';
import 'package:flutter_maps/assets/style.dart';
import 'package:flutter_maps/models/UserModel.dart';
import 'package:flutter_maps/view/mainMenu.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethode {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(userId: user.uid, name: user.displayName) : null;
  }

  UserModel _userException(String message) {
    return message != null ? UserModel(message: message) : null;
  }

  Future signInAuth(String email, String password) async {
    try {
      UserCredential result = await _authService.signInWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (exception) {
      return _userException(exception.toString());
    }
  }

  Future signUpAuth(String email, String password) async {
    try {
      UserCredential result = await _authService.createUserWithEmailAndPassword(
          email: email, password: password);

      User firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (exception) {
      return _userException(exception.toString());
    }
  }

  Future signInwithGoogle() async {
    try {
      GoogleSignIn _googleSignIn = new GoogleSignIn();
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      UserCredential result =
          (await _authService.signInWithCredential(credential));
      User firebaseUser = result.user;
      UserModel userModel = _userFromFirebaseUser(firebaseUser);
      SharedPreferences.getInstance().then((value) {
        value.setString('nameAccount', userModel.name);
      });
      return _userFromFirebaseUser(firebaseUser);
    } catch (exception) {
      return _userException(exception.toString());
    }
  }

  // ignore: missing_return

  //  Future signUpwithGoogle() async {
  //   try {
  //     GoogleR _googleSignIn = new GoogleSignIn();
  //     GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
  //     GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;

  //     AuthCredential credential = GoogleAuthProvider.credential(
  //         idToken: googleSignInAuthentication.idToken,
  //         accessToken: googleSignInAuthentication.accessToken);

  //     UserCredential result =
  //         (await _authService.signInWithCredential(credential));
  //     User firebaseUser = result.user;
  //     return _userFromFirebaseUser(firebaseUser);
  //   } catch (exception) {
  //     return _userException(exception.toString());
  //   }
  // }
}
