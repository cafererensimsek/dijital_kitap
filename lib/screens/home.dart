import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).accentColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
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
      ),
    );
  }
}
