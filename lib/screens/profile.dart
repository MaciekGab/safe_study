import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/SizeConfig.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:safe_study/services/authentication_service.dart';
import 'package:safe_study/widgets/app_bar_with_gradient.dart';
import 'package:safe_study/widgets/rounded_raised_button.dart';
import 'package:safe_study/widgets/text_with_rounded_container.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>();
    final firebaseUser = context.watch<User>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBarGradient(),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: SizeConfig.safeBlockVertical * 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextRounded(
                              text: 'Profil',
                              screenPercentageHeight: 10,
                              screenPercentageWidth: 30,
                              roundedSide: 'right',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: RoundedRaisedButton(
                                onPressed: () {
                                  context.read<AuthenticationService>().singOut();
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(' Wyloguj ', style: TextStyle( fontSize: 4 * SizeConfig.safeBlockHorizontal),),
                                    Icon(Icons.logout, size: 4 * SizeConfig.safeBlockHorizontal,),
                                  ],
                                )),
                          ),
                        ],
                      ),
                      SizedBox( height: SizeConfig.safeBlockVertical * 3,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextRounded(
                          text: user.name + ' ' + user.surname,
                          screenPercentageHeight: 10,
                          screenPercentageWidth: 80,
                          roundedSide: 'left',
                        ),
                      ),
                      SizedBox(height: SizeConfig.safeBlockVertical * 1,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: RoundedRaisedButton(
                              onPressed: () {
                                context.read<AuthenticationService>().singOut();
                                Navigator.pop(context);
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(' Zmień hasło ', style: TextStyle( fontSize: 4 * SizeConfig.safeBlockHorizontal),),
                                  Icon(Icons.vpn_key_outlined, size: 4 * SizeConfig.safeBlockHorizontal,),
                                ],
                              )),
                        ),
                      ),
                      Align(alignment: Alignment.centerLeft,child: Padding(padding: EdgeInsets.only(left: 20),child: Text("Historia: "))),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                    // gradient: LinearGradient(
                    //     begin: Alignment.bottomLeft,
                    //     end: Alignment.topRight,
                    //     colors: [
                    //       Color.fromRGBO(112, 35, 238, 0.5),
                    //       Color.fromRGBO(112, 35, 238, 1)
                    //     ])
                      ),
                        width: double.infinity,
                        height: 700.0,
                        padding: EdgeInsets.all(10.0),
                        child: Text('Lista '),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return ;
  }
}
