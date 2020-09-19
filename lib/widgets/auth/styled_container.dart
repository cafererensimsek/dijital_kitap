import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  final Widget stack;

  const StyledContainer(this.stack);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
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
                Color.fromRGBO(28, 18, 18, 1),
                Color.fromRGBO(138, 135, 135, 1),
              ],
            ),
          ),
          child: stack,
        ),
      ),
    );
  }
}
