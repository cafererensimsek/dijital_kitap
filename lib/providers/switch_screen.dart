import 'package:flutter/material.dart';

class SwitchScreen with ChangeNotifier {
  bool _isSignIn = true;

  bool get isSignIn {
    return _isSignIn;
  }

  void switchAuth() {
    print(_isSignIn);
    _isSignIn = !_isSignIn;
    print(_isSignIn);
    notifyListeners();
  }
}
