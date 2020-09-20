import 'package:dijital_kitap/providers/home_provider.dart';
import 'package:dijital_kitap/widgets/home/book_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget implements PreferredSizeWidget {
  SearchBar() : preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    bool isSearching = Provider.of<HomeProvider>(context).isSearching;
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text('Dijital Kitap'),
      actions: [
        IconButton(
          icon: Icon(!isSearching ? Icons.search : Icons.arrow_back,
              color: Colors.white),
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
