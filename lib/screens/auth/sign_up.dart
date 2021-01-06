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
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();

  //TODO: Implement validation to both inputs
  //TODO: Add loading screen - something like circularProgressIndicator or custom form pub.dev
  //TODO: Implement UI
//TODO: maybe add button to pop form this screen?
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Name"),
            ),
            TextField(
              controller: surnameController,
              decoration: InputDecoration(labelText: "Surname"),
            ),
            RaisedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  context.read<AuthenticationService>().signUp(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      name: nameController.text.trim(),
                      surname: surnameController.text.trim());
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignIn();
                      },
                    ),
                  );
                },
                child: Text("Sign up")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Masz konta?"),
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
                    child: Text("Zaloguj się"))
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
