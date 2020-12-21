import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_maps/models/UserModel.dart';

class AuthMethode {
  final FirebaseAuth _authService = FirebaseAuth.instance;

  UserModel _userFromFirebaseUser(User user) {
    return user != null ? UserModel(userId: user.uid) : null;
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
}
