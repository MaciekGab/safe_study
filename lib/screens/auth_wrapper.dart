import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:safe_study/screens/auth/sign_in.dart';
import 'package:safe_study/screens/home/home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();


    if(firebaseUser != null){
      return Home();
    }
    return SignIn();
  }
}

//Provider<DatabaseService>(create: (_) => DatabaseService(uid: ))
//         StreamProvider(
//             create: (context) => context.read<DatabaseService>().streamUser)
