import '../../providers/switch_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthButton extends StatelessWidget {
  final String email;
  final String password;

  AuthButton(this.email, this.password);

  void _signIn(String email, String password, BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = FirebaseAuth.instance.currentUser;
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(e.message),
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
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    bool isSignIn = Provider.of<SwitchScreen>(context).isSignIn;
    return Positioned(
      left: 20 * width / 24,
      top: 80 * height / 100,
      child: IconButton(
        icon: Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 30),
        onPressed: isSignIn
            ? () => _signIn(email, password, context)
            : () => _signUp(email, password, context),
      ),
    );
  }
}
