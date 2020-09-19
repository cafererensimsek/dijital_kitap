import 'package:dijital_kitap/widgets/auth/auth_button.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/switch_screen.dart';
import 'widgets/auth/email_field.dart';
import 'widgets/auth/password_field.dart';
import 'widgets/auth/rotated_text.dart';
import 'widgets/auth/slogan_text.dart';
import 'widgets/auth/switch_screen_text.dart';
import 'widgets/auth/title_text.dart';

void main() => runApp(DijitalKitap());

class DijitalKitap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SwitchScreen(),
      child: MaterialApp(
        title: 'DijitalKitap',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? Auth()
                  : Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String _email;
  String _password;

  @override
  void initState() {
    super.initState();
    emailController.addListener(
      () => _email = emailController.text,
    );
    passwordController.addListener(
      () => _password = passwordController.text,
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
