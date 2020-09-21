import 'package:dijital_kitap/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Theme.of(context).accentColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: _selectedIndex,
      onTap: (index) =>
          Provider.of<HomeProvider>(context, listen: false).changeScreen(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('1'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('1'),
        ),
      ],
    );
  }
}
