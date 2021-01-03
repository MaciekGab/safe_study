import 'package:flutter/material.dart';
import 'package:safe_study/authentication_service.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/auth/sign_up.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
            onPressed: () {
              context.read<AuthenticationService>().signIn(
                  email: emailController.text.trim(),
                  password: passwordController.text.trim());
            },
            child: Text("Sign in")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Nie masz konta?"),
                TextButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                }, child: Text("Zarestruj się"))
              ],
            ),
      ]),
    );
  }
}
