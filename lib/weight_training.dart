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
              height: MediaQuery.of(context).size.height -200 ,
              child: ListView.builder(
                itemCount: bodyParts.length,
                itemBuilder: (context,index)=>
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 244, 198, 198)
                    ),
                    child: 
                    ListTile(
                      // shape: CircleBorder(side: BorderSide(),eccentricity:0.6),
                      title: Text(bodyParts[index]),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.navigate_next),
                        ],
                        
                      ),
                    ),
                  )
                ),
            )
        
          ],
        ),
      )
    );
  }
}