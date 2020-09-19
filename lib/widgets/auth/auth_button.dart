import 'package:dijital_kitap/screens/home.dart';

import '../../providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  void _signIn(String email, String password, BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = FirebaseAuth.instance.currentUser;
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

  void _signUp(String email, String password, BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = FirebaseAuth.instance.currentUser;
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

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool isSignIn = Provider.of<AuthProvider>(context).isSignIn;
    String _email = Provider.of<AuthProvider>(context).email;
    String _password = Provider.of<AuthProvider>(context).password;
    return Positioned(
      left: 20 * width / 24,
      top: 80 * height / 100,
      child: IconButton(
        icon: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 30),
        onPressed: isSignIn
            ? () => _signIn(_email, _password, context)
            : () => _signUp(_email, _password, context),
      ),
    );
  }
}
