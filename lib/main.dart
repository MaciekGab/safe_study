import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:safe_study/services/authentication_service.dart';
import 'package:safe_study/user_data_provider.dart';

import 'model/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final firebaseUser = context.watch<User>();
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

