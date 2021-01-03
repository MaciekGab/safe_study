import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/auth/sign_in.dart';

import '../../authentication_service.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
            RaisedButton(
                onPressed: () async{
                  print(emailController.text);
                  print(passwordController.text);
                  await context.read<AuthenticationService>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim());
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text("Sign up")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Masz kont?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn()));
                }, child: Text("Zaloguj się"))
              ],
            ),
          ]),
    );
  }
}