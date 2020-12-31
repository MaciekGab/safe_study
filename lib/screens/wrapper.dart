import 'package:flutter/material.dart';
import 'package:safe_study/screens/authenticate/authenticate.dart';
import 'package:safe_study/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // zwraca albo ekran główny albo ekran logowania
    return Authenticate();
  }
}
