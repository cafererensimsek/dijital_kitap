import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    MaterialColor color =
        Provider.of<Renk>(context).determineColor(_selectedIndex)[0];
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _selectedIndex,
      onTap: (index) =>
          Provider.of<HomeProvider>(context, listen: false).toggleIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Ana menü'),
          backgroundColor: color,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favoriler'),
          backgroundColor: color,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profil'),
          backgroundColor: color,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Ayarlar'),
          backgroundColor: color,
        ),
      ],
    );
  }
}
