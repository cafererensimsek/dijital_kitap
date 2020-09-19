import 'package:flutter/foundation.dart';

class DijiUser with ChangeNotifier {
  final String id;
  final String name;
  final String surname;
  String username;
  //final DateTime dateOfBirth;

  DijiUser({
    @required this.id,
    @required this.name,
    @required this.surname,
    @required this.username,
    //@required this.dateOfBirth,
  });
}
