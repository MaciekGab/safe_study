import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/home/home_teacher.dart';
import 'package:safe_study/screens/home/home_user.dart';
import 'package:safe_study/screens/home/home_wrapper.dart';
import 'package:safe_study/services/database_service.dart';
import 'package:safe_study/model/user_model.dart';

import 'auth/sign_in.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);
    // final user = Provider.of<UserModel>(context);
    // DatabaseService databaseService = DatabaseService(uid: firebaseUser.uid);

    if (firebaseUser != null) {
      return
      Home();
        // MultiProvider(providers: [
        //     Provider<DatabaseService>(create: (_) => DatabaseService()),
        //     StreamProvider(create: (context) => context.read<DatabaseService>().getUser(firebaseUser.uid),)
        //     ], child: Home());
        //     StreamProvider<UserModel>.value(value: DatabaseService().getUser(firebaseUser.uid),child: Home(),);

      // if (user == null)
      //   return Scaffold(body: Center(child: CircularProgressIndicator()));
      // if(user.role == 'admin')
      //   return HomeTeacher();
      // else
      //   return HomeUser();
      // return Home();
      // StreamProvider<UserModel>.value(value: DatabaseService(uid: firebaseUser.uid).streamUser,child: Home());
    }
    return SignIn();
  }
}