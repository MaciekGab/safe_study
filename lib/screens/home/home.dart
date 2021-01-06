import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:safe_study/screens/home/home_admin.dart';
import 'package:safe_study/screens/home/home_user.dart';
import 'package:safe_study/screens/profile.dart';
import 'package:slide_button/slide_button.dart';
import 'package:safe_study/database_service.dart';
import '../../database_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    DatabaseService databaseService = DatabaseService(uid: firebaseUser.uid);
    return
    //   MultiProvider(providers: [
    //   Provider<DatabaseService>(
    //       create: (_) => DatabaseService(uid: firebaseUser.uid)),
    //   StreamProvider(
    //       create: (context) => context.read<DatabaseService>().streamUser)
    // ], child: HomeWrapper());
    StreamBuilder(
        stream: databaseService.streamUser,
        builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
          if (snapshot.hasData) {
            return checkRole(snapshot.data);
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return CircularProgressIndicator();
          }
        });

  }

  Widget checkRole(UserModel userModel) {
    if (userModel.role == 'admin') {
      return HomeAdmin();
    } else
      return HomeUser();
  }
}
