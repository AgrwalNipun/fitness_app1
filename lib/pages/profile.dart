import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

SafeArea profilePage() {
  final firestore = FirebaseFirestore.instance;
  getUserData();
  return SafeArea(
    child: FutureBuilder(
      future:FirebaseFirestore.instance.collection("user_info").where('email',isEqualTo: FirebaseAuth.instance.currentUser!.email).get() ,
      builder:
          (context, snapshot) => Column(
            children: [
              ListTile(
                leading: Text("Name", style: TextStyle(fontSize: 20)),
                trailing: Text(
                  snapshot.data!.docs[0].data()["email"]
                ),
              ),
            ],
          ),
    ),
  );
}

void getUserData() async {
  final data = await FirebaseFirestore.instance.collection("user_info").get();
  print(data);
}
