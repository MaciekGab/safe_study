import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/SizeConfig.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:safe_study/widgets/app_bar_with_gradient.dart';
import 'package:safe_study/widgets/menu_rounded_button.dart';
import 'package:safe_study/widgets/profile_button.dart';
import 'package:safe_study/widgets/text_with_rounded_container.dart';
import '../../services/authentication_service.dart';
import '../profile.dart';

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    final user = context.watch<UserModel>();
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBarGradient(),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextRounded(
                  text: "Witaj, ${firebaseUser.email}",
                  roundedSide: 'left',
                  screenPercentageHeight: 10,
                  screenPercentageWidth: 65,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 8,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MenuRoundedButton(
                  onPressed: () {},
                  text: 'Dołącz do spotkania',
                  iconName: Icons.group_rounded,
                  roundedSide: 'right',
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 5,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MenuRoundedButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => testScreen()));
                  },
                  text: 'Zgłoś',
                  iconName: Icons.local_hospital_outlined,
                  roundedSide: 'right',
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 17,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ProfileButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
