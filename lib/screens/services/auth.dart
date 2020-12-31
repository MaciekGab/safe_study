import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in in anon
  Future signInAnon() async{
    try{
       UserCredential userCredential = await _auth.signInAnonymously();
       User user = userCredential.user;
       return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
}
  //sign in  with email & password

  //register with emial & passoword

  //sing out

}