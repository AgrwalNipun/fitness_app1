import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<String> createUserWithMAilAndPassword(
  String mail,
  String password,
) async {
  dynamic inst = FirebaseAuth.instance;

  try {
    final res = await inst.createUserWithEmailAndPassword(email: mail, password: password);
    print("Current user ${FirebaseAuth.instance.currentUser}");
    return res.toString();
  } on FirebaseAuthException catch (e) {
    print(e);
    return e.toString();
  }
}

void signInUser(String email, String password) async {
  try {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e);
  }
}
