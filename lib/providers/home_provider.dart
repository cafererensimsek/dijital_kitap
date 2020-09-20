import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool isSearching = false;

  int get index {
    return _selectedIndex;
  }

  void changeScreen(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
