import 'package:dijital_kitap/models/book.dart';
import 'package:dijital_kitap/providers/book_provider.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:dijital_kitap/widgets/home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSearch extends SearchDelegate<Book> {
  final BuildContext context;

  BookSearch(this.context);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Book> bookList = Provider.of<Books>(context).bookList;
    final results =
        bookList.where((b) => b.authorFirstName.toLowerCase().contains(query));
    return ListView(
      children: results
          .map<Widget>(
            (b) => ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookDetails(b),
                ),
              ),
              title: Text(
                '  ${b.authorFirstName}',
                style: TextStyle(
                    //color: Colors.white70,
                    ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Book> bookList = Provider.of<Books>(context).bookList;

    final results =
        bookList.where((b) => b.authorFirstName.toLowerCase().contains(query));

    return query == ""
        ? Center(
            child: Text(
              'Yüzlerce kitabı ara...',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView(
            children: results
                .map<Widget>(
                  (b) => ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => BookDetails(b),
                      ),
                    ),
                    title: Text(
                      '  ${b.authorFirstName}',
                      style: TextStyle(
                          //color: Colors.white70,
                          ),
                    ),
                  ),
                )
                .toList(),
          );
  }
}
