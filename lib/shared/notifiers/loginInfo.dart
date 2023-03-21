import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:krch_chat_app/firebase_services/firebase_get.dart';
import 'package:krch_chat_app/models/firebase_resutl.dart';
import 'package:krch_chat_app/shared/preferences/prefOperations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_services/firebase_auth.dart';
import '../../models/models.dart';

class LoginInfo extends ChangeNotifier {
  late final SharedPreferences sharedPreferences;
  late Users _user;
  Users get user => _user;
  LoginInfo(this.sharedPreferences);
  bool _initialized = false;
  bool get initialized => _initialized;

  set initialized(bool value) {
    _initialized = value;
    notifyListeners();
  }

  set user(Users user) {
    _user = user;
    PrefOperation().setUid(user.uid!, sharedPreferences);
    initialized = true;
    notifyListeners();
  }

  Future<FirebaseResult> login() async {
    print('1');
    FirebaseResult result = FirebaseResult(
        boolResult: false,
        error: FirebaseAuthException(
            message: "Not Inititialized", code: "Not_Initialized"));
    try {
      await FirebaseAuthService().signInWithGoogle().then((value) async {
        await FirebaseGet().getUserById(value).then((value) async {
          if (value.uid == null) {
            result = FirebaseResult(
                boolResult: false,
                error: FirebaseAuthException(
                    message: "User is Null", code: "Null_User"));
          }

          user = value;

          result = FirebaseResult(boolResult: true, result: value);
        });
      });
    } on FirebaseAuthException catch (e) {
      return FirebaseResult(boolResult: false, error: e);
    }
    return result;
  }

  Future<FirebaseResult> autoLogin() async {
    FirebaseResult result = FirebaseResult(
        boolResult: false,
        error: FirebaseAuthException(
            message: "Not Inititialized", code: "Not_Initialized"));

    String uid = PrefOperation().getUid(sharedPreferences);
    if (uid != "" && uid != null) {
      await FirebaseGet().getUserById(uid).then((value) async {
        if (value.uid == null) {
          result = FirebaseResult(
              boolResult: false,
              error: FirebaseAuthException(
                  message: "User is Null", code: "Null_User"));
        }

        user = value;

        result = FirebaseResult(boolResult: true, result: value);
      });
    }

    return result;
  }

  Future<void> logout() async {
    await FirebaseAuthService().logOut();
    _initialized = false;
    PrefOperation().setUid("", sharedPreferences);
    notifyListeners();
  }
}
