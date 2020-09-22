import 'package:dijital_kitap/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authentication with ChangeNotifier {
  bool _isSignIn = true;
  String _email;
  String _password;
  User _user;

  bool get isSignIn => _isSignIn;

  String get email => _email;

  String get password => _password;

  User get currentUser => _user;

  void switchAuth() {
    _isSignIn = !_isSignIn;
    notifyListeners();
  }

  void changeEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void changePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void changeUser(User user) => _user = user;

  void signIn(BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      changeUser(FirebaseAuth.instance.currentUser);
      Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
        (route) => false,
      );
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(Icons.error),
              SizedBox(width: 30),
              Flexible(
                  child: Text(e.message != null ? e.message : e.toString())),
            ],
          ),
        ),
      );
    }
  }

  void signUp(BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      changeUser(FirebaseAuth.instance.currentUser);
      Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
        (route) => false,
      );
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Row(
            children: [
              Icon(Icons.error),
              SizedBox(width: 30),
              Flexible(
                  child: Text(e.message != null ? e.message : e.toString())),
            ],
          ),
        ),
      );
    }
  }
}
