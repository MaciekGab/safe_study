import 'package:flutter/material.dart';
import 'file:///C:/Users/mgmac/IdeaProjects/safe_study/lib/services/authentication_service.dart';
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.5, 0.9],
                  colors: [Colors.white, Color.fromRGBO(205, 160, 241, 1)])),
          child: SingleChildScrollView(
            child: Container(
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
                      var result = context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                      // if(result.toString() == 'user-not-found')
                          print(result);
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
      ),
    );
  }
}
