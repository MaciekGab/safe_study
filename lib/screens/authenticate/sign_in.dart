import 'package:flutter/material.dart';
import 'package:safe_study/screens/services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Sign in Anonymously'),
            onPressed: () async {
              dynamic result = await _auth.signInAnon();
              if (result == null) {
                print('no user');
              }
              else {
                print('user sign in');
                print(result);
              }
            },
          ),
        ),
      ),
    );
  }
}
