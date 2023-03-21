import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseResult {
  final dynamic? result;
  final FirebaseAuthException? error;
  final bool? boolResult;

  FirebaseResult({this.result, this.error, this.boolResult});

  Map<String, dynamic> toMap() => {
        'result': result,
        'error': error,
        'boolResult': boolResult,
      };

  FirebaseResult copyWith(
      {dynamic? result, FirebaseAuthException? error, bool? boolResult}) {
    return FirebaseResult(
      result: result ?? this.result,
      error: error ?? this.error,
      boolResult: boolResult ?? this.boolResult,
    );
  }

  @override
  String toString() {
    return '${result.toString()}, ${error.toString()}, ';
  }
}
