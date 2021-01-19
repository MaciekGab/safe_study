import 'package:flutter/material.dart';

import '../SizeConfig.dart';

class ProfileButton extends StatelessWidget {
  final Function onPressed;

  const ProfileButton({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0.0),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          bottomLeft: Radius.circular(45),
        )),
        child: Container(
          height: SizeConfig.safeBlockVertical * 10,
          width: SizeConfig.safeBlockHorizontal * 40,
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
                ]),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: SizeConfig.safeBlockVertical * 2,
                    ),
                    Icon(
                      Icons.person,
                      size: 4 * SizeConfig.safeBlockVertical,
                    ),
                  ],
                ),
                Text('Profil',
                    style:
                        TextStyle(fontSize: 4 * SizeConfig.safeBlockVertical)),
                SizedBox(),
              ],
            ),
          ),
        ));
  }
}
