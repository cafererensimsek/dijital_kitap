import 'package:dijital_kitap/providers/book.dart';
import 'package:dijital_kitap/widgets/home/book_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = Provider.of<Book>(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BookDetails(book),
        ),
      ),
      child: GridTile(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Image.network(
            book.avatar,
            errorBuilder: (_, __, ___) => Text('😢'),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes
                      : null,
                ),
              );
            },
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.white38,
          leading: IconButton(
            icon:
                Icon(!book.isFavorite ? Icons.favorite_border : Icons.favorite),
            onPressed: () => book.toggleFavorite(book),
          ),
          title: Text(book.authorFirstName),
          subtitle: Text(book.categories),
        ),
      ),
    );
  }
}
