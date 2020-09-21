import 'package:dijital_kitap/providers/home_provider.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:dijital_kitap/widgets/home/all_books.dart';
import 'package:dijital_kitap/widgets/home/bottom_navigation.dart';
import 'package:dijital_kitap/widgets/home/favorites.dart';
import 'package:dijital_kitap/widgets/home/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  Widget showBody(int index) {
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

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    return Scaffold(
      appBar: SearchBar(),
      body: showBody(_selectedIndex),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
