import '../../providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailField extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    emailController.addListener(() =>
        Provider.of<Authentication>(context, listen: false)
            .changeEmail(emailController.text));
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Positioned(
      top: 60 * height / 100,
      left: width / 15,
      width: width,
      child: Container(
        margin: EdgeInsets.fromLTRB(width / 5, 0, width / 5, 0),
        child: TextField(
          controller: emailController,
          style: TextStyle(color: Colors.white, fontSize: 25),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'email',
            hintStyle: TextStyle(color: Colors.white70, fontSize: 25),
            border: InputBorder.none,
            isDense: true,
          ),
        ),
      ),
    );
  }
}
