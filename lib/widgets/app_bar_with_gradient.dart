import 'package:flutter/material.dart';

class AppBarGradient extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarGradient({Key key}) :this.preferredSize = Size.fromHeight(50.0), super(key: key);


  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("Safe Study"),
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(112, 35, 238, 0.5),
                  Color.fromRGBO(112, 35, 238, 1)
                ])),
      ),
    );
  }
}
