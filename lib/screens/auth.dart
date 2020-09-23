import 'package:flutter/material.dart';
import '../widgets/auth/auth_button.dart';
import '../widgets/auth/email_field.dart';
import '../widgets/auth/password_field.dart';
import '../widgets/auth/rotated_text.dart';
import '../widgets/auth/slogan_text.dart';
import '../widgets/auth/styled_container.dart';
import '../widgets/auth/switch_screen_text.dart';
import '../widgets/auth/title_text.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StyledContainer(
        child: Stack(
          children: [
            RotatedText(),
            TitleText(),
            SloganText(),
            EmailField(),
            PasswordField(),
            AuthButton(),
            SwitchScreenText(),
          ],
        ),
      ),
    );
  }
}
