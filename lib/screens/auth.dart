import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/auth/auth_button.dart';
import '../widgets/auth/email_field.dart';
import '../widgets/auth/password_field.dart';
import '../widgets/auth/rotated_text.dart';
import '../widgets/auth/slogan_text.dart';
import '../widgets/auth/styled_container.dart';
import '../widgets/auth/switch_screen_text.dart';
import '../widgets/auth/title_text.dart';
import '../providers/auth_provider.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailController.addListener(
      () => Provider.of<AuthProvider>(context, listen: false)
          .changeEmail(emailController.text),
    );
    passwordController.addListener(
      () => Provider.of<AuthProvider>(context, listen: false)
          .changePassword(passwordController.text),
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String _email = Provider.of<AuthProvider>(context).email;
    String _password = Provider.of<AuthProvider>(context).password;
    return Scaffold(
      body: StyledContainer(
        Stack(
          children: [
            RotatedText(),
            TitleText(),
            SloganText(),
            EmailField(emailController),
            PasswordField(passwordController),
            AuthButton(_email, _password),
            SwitchScreenText(),
          ],
        ),
      ),
    );
  }
}
