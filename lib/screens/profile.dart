import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            color: Colors.blue,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.red,
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text('Red container should be scrollable'),
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
    );

  }
}
