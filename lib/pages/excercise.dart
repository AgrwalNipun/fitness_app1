import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/pages/homepage.dart';
import 'package:fitness_app/pages/weight_training.dart';
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
      backgroundColor: const Color(0xFFE0E0E0),
      body: 
      Consumer(
        builder:(context, ref, child) =>
        FutureBuilder(
          future: FirebaseFirestore.instance.collection("excersises_db").where("Target",isEqualTo:ref.read(bodyPartProvider)).get(),
          builder: (context,snapshot){
            if(!snapshot.hasData){
              return Center(child : CircularProgressIndicator());
            }
            final excerciseMap = snapshot.data!.docs[0].data();
            return Column(
              children: [
                Text(excerciseMap["Name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(excerciseMap["Description"],style: TextStyle(fontSize: 16),),
                ),

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: (excerciseMap["Reps"] as List).length,
                  itemBuilder: (context,index){
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                
                      ),
                      child: Text((excerciseMap["Reps"] as List)[index].toString()));
                  }),
                Image.network(excerciseMap["Link"]),
              ],
            );
          }),
      )
    );
  }
}