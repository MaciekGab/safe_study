import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/auth/sign_in.dart';
import 'package:safe_study/screens/home/home_wrapper.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);

    if (firebaseUser != null) {
      return Home();
      // StreamProvider<UserModel>.value(value: DatabaseService(uid: firebaseUser.uid).streamUser,child: Home());
    }
    return SignIn();
  }
}