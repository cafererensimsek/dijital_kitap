import 'package:dijital_kitap/providers/book.dart';
import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:dijital_kitap/widgets/home/detail_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'like_button.dart';

class BookDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Book book = Provider.of<Book>(context);
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    MaterialColor color =
        Provider.of<Renk>(context).determineColor(_selectedIndex)[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(book.authorFirstName),
        backgroundColor: color,
      ),
      body: StyledContainer(
        child: Stack(
          children: [
            DetailCard(),
            LikeButton(),
          ],
        ),
      ),
    );
  }
}
