import 'package:flutter/material.dart';

class Authentication with ChangeNotifier {
  bool _isSignIn = true;
  String _email;
  String _password;

  bool get isSignIn {
    return _isSignIn;
  }

  String get email {
    return _email;
  }

  String get password {
    return _password;
  }

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
}
