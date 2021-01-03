import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/authentication_service.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Center(child: Text('home')),
              RaisedButton(
                onPressed: () {
                  context.read<AuthenticationService>().singOut();
                },
                child: Text("Sign out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
