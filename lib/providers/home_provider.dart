import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get index {
    return _selectedIndex;
  }

  void changeScreen(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
