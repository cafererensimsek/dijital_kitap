import 'package:dijital_kitap/providers/book_provider.dart';
import 'package:dijital_kitap/widgets/auth/styled_container.dart';
import 'package:dijital_kitap/widgets/home/book_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StyledContainer(
      child: ChangeNotifierProvider.value(
        value: Books(),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.transparent,
                  width: 2,
                ),
              ),
              child: BookTile(index),
            );
          },
        ),
      ),
    );
  }
}
