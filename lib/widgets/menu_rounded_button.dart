import 'package:flutter/material.dart';

import '../SizeConfig.dart';

class MenuRoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final IconData iconName;
  final String roundedSide;

  const MenuRoundedButton({Key key, this.text, this.onPressed, this.iconName, this.roundedSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return roundedSide == 'left' ? RaisedButton(
          onPressed: onPressed,
          padding: const EdgeInsets.all(0.0),
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomLeft: Radius.circular(45),
              )
          ),
          child: Container(
            height: SizeConfig.safeBlockVertical * 10,
            width: SizeConfig.safeBlockHorizontal * 80,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45),
                bottomLeft: Radius.circular(45),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromRGBO(112, 35, 238, 0.5),
                    Color.fromRGBO(112, 35, 238, 1)
                  ]
              ),
            ),
            padding:  EdgeInsets.all(10.0),
            child:  Center(
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(text,
                    style: TextStyle(
                        fontSize: 3 * SizeConfig.safeBlockVertical)),
                Row(
                  children: [
                    Icon(iconName, size: 4 * SizeConfig.safeBlockVertical,),
                    SizedBox(width: SizeConfig.safeBlockVertical * 2,)
                  ],
                )
              ],
            ),
            ),)) : RaisedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0.0),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            )
        ),
        child: Container(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.safeBlockHorizontal * 80,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(45),
              bottomRight: Radius.circular(45),
            ),
            gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromRGBO(112, 35, 238, 0.5),
                  Color.fromRGBO(112, 35, 238, 1)
                ]
            ),
          ),
          padding:  EdgeInsets.all(10.0),
          child:  Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(text,
                    style: TextStyle(
                        fontSize: 3 * SizeConfig.safeBlockVertical)),
                Row(
                  children: [
                    Icon(iconName, size: 4 * SizeConfig.safeBlockVertical,),
                    SizedBox(width: SizeConfig.safeBlockVertical * 2,)
                  ],
                )
              ],
            ),
          ),));
  }
}
