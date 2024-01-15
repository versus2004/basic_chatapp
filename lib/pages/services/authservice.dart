import 'package:chatapp/pages/services/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Authservice extends ChangeNotifier {
  //get current user

  final FirebaseAuth _instal = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  User? getcurret() {
    return _instal.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _instal.signInWithEmailAndPassword(
          email: email, password: password);
      _firestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'Email': email});

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _instal
          .createUserWithEmailAndPassword(email: email, password: password);
      _firestore
          .collection('Users')
          .doc(userCredential.user!.uid)
          .set({'uid': userCredential.user!.uid, 'Email': email});
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOut() async {
    return await FirebaseAuth.instance.signOut();
  }
}
