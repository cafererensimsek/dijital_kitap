import '../../providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PasswordField extends StatelessWidget {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    passwordController.addListener(
      () => Provider.of<AuthProvider>(context, listen: false)
          .changePassword(passwordController.text),
    );
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Positioned(
      top: 60 * height / 100 + 100,
      left: width / 15,
      width: width,
      child: Container(
        margin: EdgeInsets.fromLTRB(width / 5, 0, width / 5, 0),
        child: TextField(
          controller: passwordController,
          style: TextStyle(color: Colors.white, fontSize: 25),
          decoration: InputDecoration(
            hintText: 'şifre',
            hintStyle: TextStyle(color: Colors.white70, fontSize: 25),
            border: InputBorder.none,
            isDense: true,
          ),
          obscureText: true,
        ),
      ),
    );
  }
}
