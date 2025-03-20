import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/homepage.dart';
import 'package:fitness_app/weight_training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Excercise extends StatefulWidget {
  const Excercise({super.key});

  @override
  State<Excercise> createState() => _ExcerciseState();
}

class _ExcerciseState extends State<Excercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: 
      Consumer(
        builder:(context, ref, child) =>
        FutureBuilder(
          future: FirebaseFirestore.instance.collection("excersises_db").where("Target",isEqualTo:ref.read(bodyPartProvider)).get(),
          builder: (context,snapshot){
            final excerciseMap = snapshot.data!.docs[0].data();
            return Column(
              children: [
                Text(excerciseMap["Name"])
              ],
            );
          }),
      )
    );
  }
}