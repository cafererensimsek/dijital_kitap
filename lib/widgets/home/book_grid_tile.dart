import 'package:dijital_kitap/providers/book.dart';
import 'package:dijital_kitap/widgets/home/avatar.dart';
import 'package:dijital_kitap/widgets/home/book_tile_bar.dart';
import 'package:dijital_kitap/widgets/home/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  void seeDetails(BuildContext context, Book book) {
    Navigator.push(
      context,
      PageRouteBuilder(
        fullscreenDialog: true,
        opaque: false,
        pageBuilder: (_, __, ___) => ChangeNotifierProvider.value(
          value: book,
          child: DetailCard(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Book book = Provider.of<Book>(context);
    return GestureDetector(
      onTap: () => seeDetails(context, book),
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Avatar(book),
        ),
        footer: BookTileBar(book),
      ),
    );
  }
}
