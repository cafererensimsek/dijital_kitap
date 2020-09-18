import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(DijitalKitap());

class DijitalKitap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DijitalKitap',
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.done
                ? Auth()
                : Center(child: CircularProgressIndicator()),
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
  bool isSignIn = true;
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

  void _signIn(String email, String password, BuildContext ctx) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = FirebaseAuth.instance.currentUser;
      print(user);
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
      print(user);
    } catch (e) {
      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(e.message),
        ),
      );
    }
  }

  void _switchAuth() {
    setState(() {
      isSignIn = !isSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Builder(
          builder: (context) => Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromRGBO(28, 18, 18, 1),
                  Color.fromRGBO(138, 135, 135, 1),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: width / 17,
                  top: height / 10,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      isSignIn ? 'giriş yap' : 'kaydol',
                      style: TextStyle(color: Colors.white38, fontSize: 50),
                    ),
                  ),
                ),
                Positioned(
                  left: width / 3,
                  top: 20 * height / 100,
                  child: Text(
                    'dijital kitap',
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                Positioned(
                  left: width / 3,
                  top: 26 * height / 100,
                  child: Text(
                    'okumanın yeni yolu',
                    style: TextStyle(color: Colors.white54, fontSize: 20),
                  ),
                ),
                EmailField(width, height, emailController),
                PasswordField(width, height, passwordController),
                Positioned(
                  left: 20 * width / 24,
                  top: 80 * height / 100,
                  child: IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        color: Colors.white70, size: 30),
                    onPressed: isSignIn
                        ? () => _signIn(_email, _password, context)
                        : () => _signUp(_email, _password, context),
                  ),
                ),
                Positioned(
                  left: 9 * width / 24,
                  top: 90 * height / 100,
                  child: RichText(
                    text: TextSpan(
                      text: isSignIn
                          ? 'hesabın yok mu? hemen kaydol!'
                          : 'zaten hesabın var mı ? giriş yap!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                      ),
                      recognizer: TapGestureRecognizer()..onTap = _switchAuth,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField(this.width, this.height, this.controller, {Key key})
      : super(key: key);

  final double width;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60 * height / 100,
      left: width / 15,
      width: width,
      child: Container(
        margin: EdgeInsets.fromLTRB(width / 5, 0, width / 5, 0),
        child: TextField(
          controller: controller,
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

class PasswordField extends StatelessWidget {
  const PasswordField(this.width, this.height, this.controller, {Key key})
      : super(key: key);

  final double width;
  final double height;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 60 * height / 100 + 100,
      left: width / 15,
      width: width,
      child: Container(
        margin: EdgeInsets.fromLTRB(width / 5, 0, width / 5, 0),
        child: TextField(
          controller: controller,
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
