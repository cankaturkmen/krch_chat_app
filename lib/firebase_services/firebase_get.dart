import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:krch_chat_app/firebase_services/firebase_service.dart';
import 'package:krch_chat_app/models/users.dart';

class FirebaseGet extends FirebaseService {
  Future<Users> getUserById(String uid) async {
    Users user = Users();

    await users.where('uid', isEqualTo: uid).get().then((QuerySnapshot value) {
      print(value.docs[0].toString());
      if (value.size != 0) {
        user = Users.fromFirestore(value.docs[0]);
        print(user.email);
        return user;
      } else {
        // TODO throw exeption
      }
    });

    return user;
  }
}
