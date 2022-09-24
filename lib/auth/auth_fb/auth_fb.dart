// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:assist_teacher/home/screens/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:assist_teacher/utils/show_snack_bar.dart';

class AuthFB {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firebaseFirestore;

  AuthFB(
    this._auth,
    this._firebaseFirestore,
  );

  // final user ={

  // };
  Future<void> signup({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final _userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // await sendEmailVerification(context);
      final user = <String, String>{
        "email": email,
        "id": _auth.currentUser!.uid
      };
      // final user = Provider.of(context, listen: false).setUser(user);
      await _firebaseFirestore
          .collection('users')
          .doc(_userCredential.user!.uid)
          .set(user);
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.pushNamed(context, BoardSelectPage.routeName);

      showSnackBar(context, 'Welcome To Teacher Assist');

      // if (!_auth.currentUser!.emailVerified) {
      //   await sendEmailVerification(context);
      // }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, "Email Verification has been Sent!");
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
    }
  }
}
