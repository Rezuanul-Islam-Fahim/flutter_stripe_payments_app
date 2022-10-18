import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../core/constants.dart';
import '../views/auth/helpers/auth_exception_handler.dart';
import '../models/user.dart' as user;

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<AuthStatus> login({
    required String email,
    required String password,
  }) async {
    AuthStatus status;

    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      status = AuthStatus.loginSuccess;
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('*********** Auth Exception ***********');
        print(e.code);
        print(e.message);
        print('== ************** == ************** ==');
      }

      status = AuthExceptionHandler.getAuthStatus(e.code);
    } catch (e) {
      status = AuthStatus.unknown;
    }

    return status;
  }

  Future<AuthStatus> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    AuthStatus status;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User userData = userCredential.user!;

      status = AuthStatus.registerSuccess;

      await _firestore
          .collection(AppConstants.userCollection)
          .doc(userData.uid)
          .set(
            user.User(
              id: userData.uid,
              email: userData.email,
              username: username,
            ).toMap(),
          );
    } on FirebaseAuthException catch (e) {
      if (kDebugMode) {
        print('*********** Auth Exception ***********');
        print(e.code);
        print(e.message);
        print('== ************** == ************** ==');
      }

      status = AuthExceptionHandler.getAuthStatus(e.code);
    } catch (e) {
      status = AuthStatus.unknown;
    }

    return status;
  }
}
