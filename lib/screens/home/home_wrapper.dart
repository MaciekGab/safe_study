import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:safe_study/screens/home/home_teacher.dart';
import 'package:safe_study/screens/home/home_user.dart';
import 'package:safe_study/screens/profile.dart';
import 'package:safe_study/services/database_service.dart';
import 'package:slide_button/slide_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    UserModel user = Provider.of<UserModel>(context);
    // DatabaseService databaseService = DatabaseService(uid: firebaseUser.uid);
    if (user == null)
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    if (user.role == 'admin')
      return HomeTeacher();
    return HomeUser();
    // StreamBuilder(
    //     stream: databaseService.streamUser,
    //     builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
    //       if (snapshot.hasData) {
    //         return checkRole(snapshot.data);
    //       } else if (snapshot.hasError) {
    //         return Icon(Icons.error_outline);
    //       } else {
    //         return CircularProgressIndicator();
    //       }
    //     });

  }
}