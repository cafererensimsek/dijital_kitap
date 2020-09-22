import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:dijital_kitap/widgets/home/book_search.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    var color = Provider.of<Renk>(context).determineColor(_selectedIndex)[0];
    var secondColor =
        Provider.of<Renk>(context).determineColor(_selectedIndex)[0];
    return GradientAppBar(
      gradient: LinearGradient(colors: [color, secondColor]),
      title: Text('Dijital Kitap'),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            showSearch(
              context: context,
              delegate: BookSearch(context),
            );
          },
        ),
      ],
    );
  }
}
