import 'package:flutter/material.dart';

class RoundedRaisedButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;

  const RoundedRaisedButton({Key key, this.child, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colors.transparent,
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(112, 35, 238, 0.5),
                  Color.fromRGBO(112, 35, 238, 1)
                ])),
        padding: EdgeInsets.all(10.0),
        child: child,
      ),
    );
  }
}
