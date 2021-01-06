import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../authentication_service.dart';
import '../profile.dart';

class HomeUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(205, 160, 241, 1),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.5, 0.9],
                  colors: [Colors.white, Color.fromRGBO(205, 160, 241, 1)])),
          child: Column(
            children: [
              Center(child: Text('home')),
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
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    textColor: Colors.white,
                    padding: const EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      bottomLeft: Radius.circular(20.0),
                    )),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            bottomLeft: Radius.circular(20.0),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Color.fromRGBO(112, 35, 238, 0.5),
                                Color.fromRGBO(112, 35, 238, 0.1)
                              ])),
                      padding: const EdgeInsets.all(10.0),
                      child: const Text('Gradient Button',
                          style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  // RaisedButton(
                  //     textColor: Colors.white,
                  //
                  //     child: Text("Search"),
                  //     onPressed: () {},
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(20.0),bottomLeft: Radius.circular(20.0),
                  //     ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
