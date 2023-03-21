import 'package:krch_chat_app/firebase_services/firebase_service.dart';
import 'package:krch_chat_app/models/users.dart';

class FirebaseGet extends FirebaseService {
  Future<Users> getUserById(String uid) async {
    Users user = Users();

    await users.where('uid', isEqualTo: uid).get().then((value) {
      if (value.size != 0) {
        user = Users.fromFirestore(value.docs[0]);
      } else {
        // TODO throw exeption
      }
    });

    return user;
  }
}
