import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/screens/auth_wrapper.dart';
import 'package:safe_study/services/database_service.dart';

class UserDataProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User>();
    final firebaseUser = Provider.of<User>(context);

    return MultiProvider(providers: [
      Provider<DatabaseService>(create: (_) => DatabaseService(uid: firebaseUser.uid)),
      StreamProvider(create: (context) => context.read<DatabaseService>().streamUser,)
    ], child: MaterialApp(
        title: 'Safe Study',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AuthWrapper()
    ));
    // StreamProvider<UserModel>.value(value: DatabaseService(uid: firebaseUser.uid).streamUser,child: Home());
  }
}