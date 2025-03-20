import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/homepage.dart';
import 'package:fitness_app/weight_training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class excercise extends StatefulWidget {
  const excercise({super.key});

  @override
  State<excercise> createState() => _excerciseState();
}

class _excerciseState extends State<excercise> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: defaultAppBar(),
    body: SafeArea(child: Center(
      child:
      Consumer(
        builder:(context, ref, child) =>  FutureBuilder(
          future:FirebaseFirestore.instance.collection("excersises_db").where("Target",isEqualTo:ref.read(bodyPartProvider)).get(),
         builder:(context,snapshot)  {
          try{
            print(snapshot.data);
          }catch(e){
            print(e);
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return CircularProgressIndicator();
        
          }
          if(!snapshot.hasData){
            return Text('no data :(');
          }
          else{
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder:(context,index)=> Text(snapshot.data!.docs[index].data()["Description"].toString()));
          }
         }
         ),
      ) 
      
      ),),
  );
  }
}

