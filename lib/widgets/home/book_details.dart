import 'package:dijital_kitap/models/book.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:flutter/material.dart';

class BookDetails extends StatelessWidget {
  final Book book;

  BookDetails(this.book);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.authorFirstName)),
      body: StyledContainer(
        child: Column(
          children: [
            Container(
              child: Image(
                image: NetworkImage(book.avatar),
              ),
            ),
            Text('${book.authorFirstName} ${book.authorLastName}'),
            Text(book.authorAge.toString()),
            Text(book.authorGender),
          ],
        ),
      ),
    );
  }
}
