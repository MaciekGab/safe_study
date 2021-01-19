import 'package:flutter/material.dart';
import 'package:safe_study/SizeConfig.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.safeBlockVertical*100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.5, 0.9],
              colors: [Colors.white, Color.fromRGBO(205, 160, 241, 1)])),
      child: child,
    );
  }
}
