import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool isSearching = false;

  int get index {
    return _selectedIndex;
  }

  bool get search {
    return isSearching;
  }

  void toggleSearchStatus() {
    isSearching = !isSearching;
    notifyListeners();
  }

  void changeScreen(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
