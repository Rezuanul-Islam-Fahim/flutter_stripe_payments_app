import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login() async {}

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    UserCredential _userData = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
