import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  final String? full_name;
  final int? age;
  final String? uid;
  final String? email;
  final DocumentSnapshot? snapshot;
  final DocumentReference? reference;
  final String? documentID;

  Users({
    this.full_name,
    this.age,
    this.uid,
    this.email,
    this.snapshot,
    this.reference,
    this.documentID,
  });

  factory Users.fromFirestore(DocumentSnapshot snapshot) {
    var map = snapshot.data() as Map;

    return Users(
      full_name: map['full_name'],
      age: map['age'],
      uid: map['uid'],
      email: map['email'],
      snapshot: snapshot,
      reference: snapshot.reference,
      documentID: snapshot.id,
    );
  }

  Map<String, dynamic> toMap() => {
        'full_name': full_name,
        'age': age,
        'uid': uid,
        'email': email,
      };

  Users copyWith({
    String? full_name,
    int? age,
    String? uid,
    String? email,
  }) {
    return Users(
      full_name: full_name ?? this.full_name,
      age: age ?? this.age,
      uid: uid ?? this.uid,
      email: email ?? this.email,
    );
  }

  @override
  String toString() {
    return '${full_name.toString()}, ${age.toString()}, ${uid.toString()},${email.toString()}, ';
  }

  @override
  bool operator ==(other) => other is Users && documentID == other.documentID;

  int get hashCode => documentID.hashCode;
}
