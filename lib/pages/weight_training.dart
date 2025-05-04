import 'package:fitness_app/default_values.dart';
import 'package:fitness_app/pages/excersise_selector_page.dart';
import 'package:fitness_app/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyPartProvider = StateProvider<String>((ref) => "");

class WeightTraining extends StatefulWidget {
  const WeightTraining({super.key});

  @override
  State<WeightTraining> createState() => _WeightTrainingState();
}

class _WeightTrainingState extends State<WeightTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(),
      backgroundColor: const Color(0xFFE0E0E0),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: bodyParts.length,
                itemBuilder:
                    (context, index) =>  Consumer(
                        builder:
                            (context, ref, child) =>Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          height: 150,
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                 // Pinkish color from the image 00BFFF
                Color.fromARGB(255, 205, 75, 75),
                Color(0xFF00BFFF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
                stops: [0.1,0.6]
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width:3)
          ),
          child: TextButton(
              onPressed: () {
                 ref.read(bodyPartProvider.notifier).update((state) => bodyParts[index]);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => excerciseSelector(),
                                  ),
                                );
                //////
                ///todo:add new page
              },
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    bodyParts[index],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        
                      ),
                    ),
              ),
            
          ],
        ),
      ),
    );
  }
}


/*

onPressed: () {
                                ref
                                    .read(bodyPartProvider.notifier)
                                    .update((state) => bodyParts[index]);
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => excerciseSelector(),
                                  ),
                                );
                              },
                              
                              */