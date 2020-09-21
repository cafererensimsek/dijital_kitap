import 'package:dijital_kitap/providers/color.dart';
import 'package:dijital_kitap/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StyledContainer extends StatelessWidget {
  final Widget child;

  const StyledContainer({this.child});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    int _selectedIndex = Provider.of<HomeProvider>(context).index;
    MaterialColor clr =
        Provider.of<Renk>(context).determineColor(_selectedIndex);
    return SingleChildScrollView(
      child: Builder(
        builder: (context) => Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                clr,
                Theme.of(context).accentColor,
              ],
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
