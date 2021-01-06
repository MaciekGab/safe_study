import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String surname;
  String role;

  UserModel({this.name, this.surname, this.role});

  factory UserModel.fromFirestore(DocumentSnapshot documentSnapshot){
    Map data = documentSnapshot.data();
    return UserModel(
      name: data['name'],
      surname: data['surname'],
      role: data['role'],
    );
  }
}