import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Renk with ChangeNotifier {
  MaterialColor determineColor(int index) {
    MaterialColor clr;
    switch (index) {
      case 0:
        clr = Colors.lightGreen;
        break;
      case 1:
        clr = Colors.red;
        break;
      case 2:
        clr = Colors.blue;
        break;
      case 3:
        clr = Colors.cyan;
        break;
    }
    return clr;
  }
}
