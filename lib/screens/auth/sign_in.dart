import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/SizeConfig.dart';
import 'package:safe_study/screens/auth/SignIn/components/background.dart';
import 'package:safe_study/screens/auth/sign_up.dart';
import 'package:safe_study/services/authentication_service.dart';
import 'package:safe_study/widgets/right_side_rounded_input_with_border.dart';
import 'package:safe_study/widgets/rounded_raised_button.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  //TODO: Implement validation to both inputs
  //TODO: Add loading screen - something like circularProgressIndicator or custom form pub.dev

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
            body: Background(
              child: SingleChildScrollView(
                child: Column(children: [
          SizedBox(
            height: SizeConfig.safeBlockVertical * 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Safe Study",
              style: TextStyle(
                  fontSize: 12 * SizeConfig.safeBlockHorizontal,
                  color: Color.fromRGBO(112, 35, 238, 1)),
            ),
          ]),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 15,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RightRoundedInput(
              suffixIcon:
                  Icon(Icons.person, color: Color.fromRGBO(112, 35, 238, 1)),
              hintText: "Email",
              style: TextStyle(fontSize: 4 * SizeConfig.blockSizeHorizontal),
              controller: emailController,
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Align(
            alignment: Alignment.centerLeft,
            child: RightRoundedInput(
              suffixIcon: Icon(Icons.vpn_key_outlined,
                  color: Color.fromRGBO(112, 35, 238, 1)),
              hintText: "Hasło",
              style: TextStyle(fontSize: 4 * SizeConfig.blockSizeHorizontal),
              controller: passwordController,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            RoundedRaisedButton(
                onPressed: () {
                  print(emailController.text);
                  var result = context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  // if(result.toString() == 'user-not-found')
                  print(result);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(' Zaloguj ',style: TextStyle(fontSize: 4 * SizeConfig.blockSizeHorizontal),),
                    Icon(Icons.arrow_forward_rounded,size: 4*SizeConfig.blockSizeHorizontal,),
                  ],
                )),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 3,
            )
          ]),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nie masz konta?"),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text(
                    "Zarestruj się",
                    style: TextStyle(color: Color.fromRGBO(112, 35, 238, 1)),
                  ))
            ],
          ),
        ]),
              ),
            )));
  }
}
