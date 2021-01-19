import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/services/authentication_service.dart';
import 'package:safe_study/user_data_provider.dart';

class AuthenticationProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),

        StreamProvider(
          create: (context) =>
          context
              .read<AuthenticationService>()
              .authStateChanges,
        ),
        // StreamProvider<UserModel>.value(value: DatabaseService(uid: firebaseUser.uid).streamUser)
      ],
      child: UserDataProvider(),
    );
  }
}
