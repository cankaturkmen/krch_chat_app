import 'package:shared_preferences/shared_preferences.dart';

class PrefOperation {
  void setUid(String uid, SharedPreferences pref) {
    pref.setString('uid', uid);
  }

  String getUid(SharedPreferences pref) {
    String? uid = pref.getString('uid');
    return uid!;
  }

  void setId(String id, SharedPreferences pref) {
    pref.setString('id', id);
  }

  String getId(SharedPreferences pref) {
    String? id = pref.getString('id');
    return id!;
  }

  void setSecretToken(String token, SharedPreferences pref) {
    pref.setString('secretToken', token);
  }

  String? getSecretToken(SharedPreferences pref) {
    String? secretToken = pref.getString('secretToken');
    return secretToken;
  }

  void setIsLoggedIn(bool isloggedIn, SharedPreferences pref) {
    pref.setBool('isLoggedIn', isloggedIn);
  }

  bool getIsLoggedIn(SharedPreferences pref) {
    bool? isLoggedIn = pref.getBool('isLoggedIn');
    return isLoggedIn!;
  }

  void setTabIndex(int index, SharedPreferences pref) {
    pref.setInt('tabIndex', index);
  }

  int? getTabIndex(SharedPreferences pref) {
    return pref.getInt('tabIndex');
  }
}
