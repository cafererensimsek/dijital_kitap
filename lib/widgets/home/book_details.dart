import 'package:dijital_kitap/providers/book.dart';
import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = Provider.of<Book>(context);
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    MaterialColor clr =
        Provider.of<Renk>(context).determineColor(_selectedIndex);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.authorFirstName),
        backgroundColor: clr,
      ),
      body: StyledContainer(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.width / 5,
              child: Container(
                width: 5 * MediaQuery.of(context).size.width / 8,
                height: 3 * MediaQuery.of(context).size.height / 6,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [Colors.green, Colors.black],
                  ),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 5)],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image(image: NetworkImage(book.avatar)),
                    Text(
                      '${book.authorFirstName} ${book.authorLastName}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${book.authorGender}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '${book.categories} - ${book.date}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                      child: Text(
                        book.description,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              left: 2 * MediaQuery.of(context).size.width / 3 + 15,
              child: IconButton(
                icon: Icon(
                  book.isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 30,
                  color: Colors.white,
                ),
                onPressed: () => Provider.of<Book>(context, listen: false)
                    .toggleFavorite(book),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
