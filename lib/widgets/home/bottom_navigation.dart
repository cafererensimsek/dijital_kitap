import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    MaterialColor clr =
        Provider.of<Renk>(context).determineColor(_selectedIndex);
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
          backgroundColor: clr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favoriler'),
          backgroundColor: clr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profil'),
          backgroundColor: clr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          title: Text('Ayarlar'),
          backgroundColor: clr,
        ),
      ],
    );
  }
}
