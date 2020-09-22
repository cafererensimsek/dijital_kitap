import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Renk with ChangeNotifier {
  List<MaterialColor> determineColor(int index) {
    MaterialColor clr;
    MaterialColor secondClr;
    switch (index) {
      case 0:
        clr = Colors.lightGreen;
        secondClr = Colors.red;
        break;
      case 1:
        clr = Colors.red;
        secondClr = Colors.lightGreen;
        break;
      case 2:
        clr = Colors.blue;
        break;
      case 3:
        clr = Colors.cyan;
        break;
    }
    return [clr, secondClr];
  }
}
