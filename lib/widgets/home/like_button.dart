import 'package:dijital_kitap/providers/book.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = Provider.of<Book>(context);
    return Positioned(
      top: MediaQuery.of(context).size.height / 6,
      left: 2 * MediaQuery.of(context).size.width / 3 + 15,
      child: IconButton(
        icon: Icon(
          book.isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () =>
            Provider.of<Book>(context, listen: false).toggleFavorite(book),
      ),
    );
  }
}
