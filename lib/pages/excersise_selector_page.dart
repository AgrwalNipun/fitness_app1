import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/pages/excercise.dart';
import 'package:fitness_app/pages/homepage.dart';
import 'package:fitness_app/pages/weight_training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final excerciseNameProvider = StateProvider((ref) => "");

class excerciseSelector extends StatefulWidget {
  const excerciseSelector({super.key});

  @override
  State<excerciseSelector> createState() => _excerciseSelectorState();
}

class _excerciseSelectorState extends State<excerciseSelector> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      body: SafeArea(
        child: Center(
          child: Consumer(
            builder:
                (context, ref, child) => FutureBuilder(
                  future:
                      FirebaseFirestore.instance
                          .collection("exercise")
                          .where(
                            "Target",
                            isEqualTo: ref.read(bodyPartProvider),
                          )
                          .get(),
                  builder: (context, snapshot) {
                    try {
                      print(snapshot.data);
                    } catch (e) {
                      print(e);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (!snapshot.hasData) {
                      return Text('no data :(');
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder:
                            (context, index) => ElevatedButton(
                              onPressed: () {
                                ref
                                    .read(excerciseNameProvider.notifier)
                                    .update(
                                      (state) =>
                                          "${snapshot.data!.docs[index].data()["Name"]}",
                                    );

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Excercise(),
                                  ),
                                );
                              },

                              child: Text(
                                snapshot.data!.docs[index]
                                    .data()["Name"]
                                    .toString(),
                              ),
                            ),
                      );
                    }
                  },
                ),
          ),
        ),
      ),
    );
  }
}
