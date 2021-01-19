import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/auth/sign_in.dart';
import 'package:safe_study/services/authentication_service.dart';
import 'package:safe_study/widgets/right_side_rounded_input_with_border.dart';
import 'package:safe_study/widgets/rounded_raised_button.dart';

import '../../SizeConfig.dart';
import 'SignIn/components/background.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  //TODO: Implement validation in every inputs
  //TODO: Add loading screen - something like circularProgressIndicator or custom form pub.dev
//TODO: maybe add button to pop form this screen?
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
            height: SizeConfig.safeBlockVertical * 5,
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
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Align(
            alignment: Alignment.centerLeft,
            child: RightRoundedInput(
              suffixIcon: Icon(Icons.vpn_key_outlined,
                  color: Color.fromRGBO(112, 35, 238, 1)),
              hintText: "Imię",
              style: TextStyle(fontSize: 4 * SizeConfig.blockSizeHorizontal),
              controller: nameController,
              onChanged: (value) {},
            ),
          ),
          SizedBox(height: SizeConfig.safeBlockVertical * 3),
          Align(
            alignment: Alignment.centerLeft,
            child: RightRoundedInput(
              suffixIcon: Icon(Icons.vpn_key_outlined,
                  color: Color.fromRGBO(112, 35, 238, 1)),
              hintText: "Nazwisko",
              style: TextStyle(fontSize: 4 * SizeConfig.blockSizeHorizontal),
              controller: surnameController,
              onChanged: (value) {},
            ),
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 5,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            RoundedRaisedButton(
                onPressed: () async {
                  print(emailController.text);
                  var result = await context.read<AuthenticationService>().signIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                      builder: (context) {
                    return SignIn();
                  }));
                  // if(result.toString() == 'user-not-found')
                  print(result);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(' Zaloguj '),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                )),
            SizedBox(
              width: SizeConfig.safeBlockHorizontal * 3,
            )
          ]),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nie masz konta?"),
              TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignIn();
                        },
                      ),
                    );
                  },
                  child: Text("Zaloguj się",
                      style: TextStyle(color: Color.fromRGBO(112, 35, 238, 1))))
            ],
          ),
        ]),
      ),
    )));
  }
}

// return SafeArea(
//   child: Scaffold(
//     body: SingleChildScrollView(
//       padding: EdgeInsets.only(right: 50),
//       child: Column(children: [
//         TextFormField(
//           controller: emailController,
//           // validator: (value) =>,
//           decoration: InputDecoration(hintText: "Email",enabledBorder: OutlineInputBorder( borderRadius:BorderRadius.only(
//             topRight: Radius.circular(20.0),
//             bottomRight: Radius.circular(20.0),
//           ), borderSide: BorderSide(color: Color.fromRGBO(112, 35, 238, 1),width: 2.0)),focusedBorder:  OutlineInputBorder( borderRadius:BorderRadius.only(
//             topRight: Radius.circular(20.0),
//             bottomRight: Radius.circular(20.0),
//           ), borderSide: BorderSide(color: Color.fromRGBO(112, 35, 238, 1),width: 2.0))),
//         ),
//         TextFormField(
//           controller: passwordController,
//           decoration: InputDecoration(labelText: "Password"),
//           // onChanged: ,
//         ),
//         TextFormField(
//           controller: nameController,
//           decoration: InputDecoration(labelText: "Name"),
//         ),
//         TextFormField(
//           controller: surnameController,
//           decoration: InputDecoration(labelText: "Surname"),
//         ),
//         RaisedButton(
//             onPressed: () {
//               print(emailController.text);
//               print(passwordController.text);
//               context.read<AuthenticationService>().signUp(
//                   email: emailController.text.trim(),
//                   password: passwordController.text.trim(),
//                   name: nameController.text.trim(),
//                   surname: surnameController.text.trim());
//               Navigator.pop(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return SignIn();
//                   },
//                 ),
//               );
//             },
//             child: Text("Sign up")),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Masz konta?"),
//             TextButton(
//                 onPressed: () {
//                   Navigator.pop(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return SignIn();
//                       },
//                     ),
//                   );
//                 },
//                 child: Text("Zaloguj się"))
//           ],
//         ),
//       ]),
//     ),
//   ),
// );
