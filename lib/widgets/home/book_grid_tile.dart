import 'package:dijital_kitap/models/book.dart';
import 'package:dijital_kitap/providers/book_provider.dart';
import 'package:dijital_kitap/widgets/home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  final int index;

  BookTile(this.index);
  @override
  Widget build(BuildContext context) {
    List<Book> bookList = Provider.of<Books>(context).bookList;
    bool isFavorite = bookList[index].isFavorite;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BookDetails(bookList[index]),
        ),
      ),
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Image(
            image: NetworkImage(bookList[index].avatar),
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white38,
          leading: IconButton(
            icon: Icon(!isFavorite ? Icons.favorite_border : Icons.favorite),
            onPressed: () => Provider.of<Books>(context, listen: false)
                .toggleFavorite(bookList[index]),
          ),
          title: Text(bookList[index].authorFirstName),
          subtitle: Text(bookList[index].categories),
        ),
      ),
    );
  }
}
