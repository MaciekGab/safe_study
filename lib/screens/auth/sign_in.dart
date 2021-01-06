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

  //TODO: Implement validation to both inputs
  //TODO: Add loading screen - something like circularProgressIndicator or custom form pub.dev
  //TODO: Implement UI


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.5, 0.9],
                    colors: [Colors.white, Color.fromRGBO(205, 160, 241, 1)])),
            child: Column(
                children: [
                  SizedBox(height: 450,),
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email", suffixIcon: Icon(Icons.person)),
              ),
                  TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: "Password"),
              ),
              RaisedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim());
                    print(emailController.text.trim());
                    print(passwordController.text);
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
          ),
        ),
      ),
    );
  }
}
