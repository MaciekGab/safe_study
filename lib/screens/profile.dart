import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/model/user_model.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserModel>();
    final firebaseUser = context.watch<User>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromRGBO(112, 35, 238, 0.5),
                      Color.fromRGBO(112, 35, 238, 1)
                    ])),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.red,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Text(user.name + ' ' + user.surname),
                      Container(
                        width: double.infinity,
                        height: 700.0,
                        padding: EdgeInsets.all(10.0),
                        color: Colors.white.withOpacity(0.7),
                        child: Text('I will have a column here'),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    // return ;
  }
}