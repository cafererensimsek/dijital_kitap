import 'package:dijital_kitap/providers/home_provider.dart';
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
      title: !isSearching
          ? Text('Dijital Kitap')
          : TextField(
              autofocus: true,
              decoration: InputDecoration(
                icon: Icon(Icons.search_sharp, color: Colors.white),
                hintText: 'Yüzlerce kitaptan arayın...',
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
      actions: [
        IconButton(
          icon: Icon(!isSearching ? Icons.search : Icons.arrow_back,
              color: Colors.white),
          onPressed: Provider.of<HomeProvider>(context, listen: false)
              .toggleSearchStatus,
        ),
      ],
    );
  }
}
