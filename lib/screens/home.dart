import 'package:dijital_kitap/widgets/home/book_grid.dart';
import 'package:dijital_kitap/widgets/home/bottom_navigation.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookGrid(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
