import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:dijital_kitap/widgets/home/all_books.dart';
import 'package:dijital_kitap/widgets/home/favorites.dart';
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

  Widget get homeBody {
    switch (index) {
      case 0:
        return BookGrid();
        break;
      case 1:
        return FavoritesGrid();
        break;
      case 2:
        return StyledContainer();
        break;
      default:
        return StyledContainer();
    }
  }
}
