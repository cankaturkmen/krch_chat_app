import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:krch_chat_app/firebase_services/firebase_service.dart';
import 'package:krch_chat_app/models/firebase_resutl.dart';

class FirebaseAuthService extends FirebaseService {
  Future<String> signInWithGoogle() async {
    // Trigger the authentication flow
    // final GoogleSignInAccount? googleUser = await GoogleSignIn(
    //   scopes: [
    //     'email',
    //     'https://www.googleapis.com/auth/contacts.readonly',
    //     "https://www.googleapis.com/auth/userinfo.profile"
    //   ],
    // ).signIn();
    var credential;
    try {
      // final GoogleSignInAccount? googleUser = await GoogleSignIn(
      //   scopes: [
      //     'email',
      //     'https://www.googleapis.com/auth/contacts.readonly',
      //     "https://www.googleapis.com/auth/userinfo.profile"
      //   ],
      // ).signIn();
      //googleUser?.clearAuthCache();

      // final GoogleSignInAccount? googleUser2 =
      await GoogleSignIn().signInSilently();
      // Obtain the auth details from the request
      // final GoogleSignInAuthentication? googleAuth =
      //     await googleUser2?.authentication;
      // final GoogleSignInAuthentication? googleAuth2 =
      //     await googleUser2?.authentication;
      // Create a new credential
      if (firebaseAuth.currentUser != null) {
        print(firebaseAuth.currentUser!.uid);
        return firebaseAuth.currentUser!.uid;
      }
      // credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth2?.accessToken,
      //   idToken: googleAuth2?.idToken,
      // );

      // return await firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
    return credential;
    // Once signed in, return the UserCredential
  }

  Future<String?> autoSignIn() async {
    String? result;
    firebaseAuth.authStateChanges().listen((User? user) async {
      if (user == null) {
        await GoogleSignIn().signInSilently();
        if (firebaseAuth.currentUser != null) {
          result = firebaseAuth.currentUser!.uid;
        }
      } else {
        result = user.uid;
      }
    });

    return result;
  }

  Future<void> logOut() async {
    firebaseAuth.signOut();
  }
}
