import 'package:dijital_kitap/providers/home_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/auth.dart';
import 'providers/books.dart';
import 'screens/auth.dart';

void main() => runApp(DijitalKitap());

class DijitalKitap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
        ChangeNotifierProvider.value(
          value: Books(),
        ),
        ChangeNotifierProvider.value(
          value: HomeProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'DijitalKitap',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(28, 18, 18, 1),
          accentColor: Color.fromRGBO(138, 135, 135, 1),
        ),
        home: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? Auth()
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
        ),
      ),
    );
  }
}
