import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:safe_study/model/user_model.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future<String> updateUserData(
      String name, String surname, String role) async {
    await userCollection
        .doc(uid)
        .set({'name': name, 'surname': surname, 'role': role});
    return 'Updated user data';
  }

  Future<UserModel> getUserData() async{
    DocumentSnapshot snapshot = await userCollection.doc(uid).get();
    return UserModel.fromFirestore(snapshot);
  }

  Stream<UserModel> get streamUser => userCollection.doc(uid).snapshots().map((snapshot) => UserModel.fromFirestore(snapshot));

}
