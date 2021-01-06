import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safe_study/model/user_model.dart';
import 'package:provider/provider.dart';
import '../../authentication_service.dart';

class HomeAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return SafeArea(
      child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.5, 0.9],
                      colors: [Colors.white, Color.fromRGBO(205, 160, 241, 1)])),
              child: Column(
                children: [
                  Center(child: Text('Admin home')),
                  Center(child: Text(firebaseUser.email)),
                  RaisedButton(
                    onPressed: () {
                      context.read<AuthenticationService>().singOut();
                    },
                    child: Text("Sign out"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    ],
                  )
                ],
              ),
            ),
          ),
    );

  }
}
