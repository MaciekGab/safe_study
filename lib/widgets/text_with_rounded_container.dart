import 'package:flutter/material.dart';
import 'package:safe_study/SizeConfig.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:provider/provider.dart';

class TextRounded extends StatelessWidget {
  final String text;
  final String roundedSide;
  final int screenPercentageHeight;
  final int screenPercentageWidth;
  const TextRounded({Key key, this.text, this.roundedSide, this.screenPercentageHeight, this.screenPercentageWidth}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int textSize = 4;
    if(text.length >= 18){
      textSize = 3;
    }
    return roundedSide == 'right' ? Container(
      height: SizeConfig.safeBlockVertical * screenPercentageHeight,
      width: SizeConfig.safeBlockHorizontal * screenPercentageWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
            right: Radius.circular(45.0)
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(112, 35, 238, 0.7),
              blurRadius: 5.0),
        ],
      ),
      padding: EdgeInsets.all(10.0),
      child: Center(child: Text(text,style: TextStyle(fontSize: textSize * SizeConfig.safeBlockVertical, color: Color.fromRGBO(112, 35, 238, 1)))),
    ) : Container(
      height: SizeConfig.safeBlockVertical * screenPercentageHeight,
      width: SizeConfig.safeBlockHorizontal * screenPercentageWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(45.0)
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(112, 35, 238, 0.7),
              blurRadius: 5.0),
        ],
      ),
      padding: EdgeInsets.all(10.0),
      child: Center(child: Text(text,style: TextStyle(fontSize: textSize * SizeConfig.safeBlockVertical, color: Color.fromRGBO(112, 35, 238, 1)))),
    )
    ;
  }
}
