import 'package:fitness_app/default_values.dart';
import 'package:fitness_app/homepage.dart';
import 'package:flutter/material.dart';

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
            Container(
              decoration: BoxDecoration(
                border: Border.all()
              ),              
              height: MediaQuery.of(context).size.height -200 ,
              child: Flexible(
                child: ListView.builder(
                  itemCount: bodyParts.length,
                  itemBuilder: (context,index)=>
                    ListTile(
                      title: Text(bodyParts[index]),
                    )
                  ),
              ),
            )
        
          ],
        ),
      )
    );
  }
}