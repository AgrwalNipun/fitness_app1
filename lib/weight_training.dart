import 'package:fitness_app/default_values.dart';
import 'package:fitness_app/excersise_page.dart';
import 'package:fitness_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final bodyPartProvider = StateProvider<String>((ref)=>"");

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
                  itemBuilder: (context,index)=>
                      Container(
                      height: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromARGB(255, 244, 198, 198)
                      ),
                      child:
                       Consumer(
                        builder: (context, ref, child) =>  ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor:Color.fromARGB(255, 244, 198, 198),
                            splashFactory: NoSplash.splashFactory,
                            shape: RoundedRectangleBorder(side: BorderSide(),borderRadius: BorderRadius.circular(10)),
                          ),  
                          onPressed: () {
                            ref.read(bodyPartProvider.notifier).update((state)=>bodyParts[index]);
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>excercise()));
                          },
                          child :
                          
                           Card(
                            // shape: CircleBorder(side: BorderSide(),eccentricity:0.6),
                            borderOnForeground: false,
                            color: Color.fromARGB(255, 244, 198, 198),
                            elevation: 0,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(bodyParts[index],style: TextStyle(fontSize: 25,color: Colors.blueGrey),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.navigate_next,size: 30,),
                                    ],
                                  ),
                                ],
                              ),),                  
                            ),
                                               ),
                       ),
                      ),
                    ),
            )
          ],
        ),
      )
    );
  }
}