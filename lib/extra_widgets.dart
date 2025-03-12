import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

  class food_chart extends StatefulWidget {
    const food_chart({super.key});

  @override
    State<food_chart> createState() => _food_chartState();
}

    class _food_chartState extends State<food_chart> {


      LineChartData food_data = LineChartData(
        lineBarsData: [LineChartBarData()]
      );
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(10,10,10,10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border.all(width: 2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,     
       children: [
        CircularPercentIndicator(
          radius: 40,
          percent: 0.4,
          lineWidth: 10,
          center:Text("Water"),
          progressColor: Colors.blue.shade700,
          //Icon(Icons.liquor),
        ),   
       Column(
        crossAxisAlignment: CrossAxisAlignment.end,
         children: [
           LinearPercentIndicator(
            width : 200,
            percent : 0.50,
            lineHeight: 10,
            leading: Text('Protien'),
            trailing: Text("70%",)
           ),
           SizedBox(
            height: 10,
           ),
           LinearPercentIndicator(
            width : 200,
            percent : 0.30,
            lineHeight: 10,
            leading: Text("Carbs"),
            progressColor: Colors.amber,
            trailing: Text("70%",)
           ),
            SizedBox(
            height: 10,
           ),
           LinearPercentIndicator(
            width : 200,
            percent : 0.70,
            lineHeight: 10,
            leading: Text("Fibers"),
            progressColor: Colors.green,
            trailing: Text("70%",)
           ),
         ],
       )
      ],),
    );
  }
  
  
}

class SelectExercise extends StatefulWidget {
  const SelectExercise({super.key});

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
        ),

        itemCount: 10,
        itemBuilder: (context, index) => 
         Container(
          margin: EdgeInsets.fromLTRB(10, 10,10,0),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              
                  Color(0xFF00BFFF), // Pinkish color from the image 00BFFF
                  Color(0xFFF5F5F5),
            ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
              ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
          child: TextButton(
            onPressed: (){
              print("$index");
            },
            style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            child: Text('$index')),)

        ,
        
        
      ),
    );
  }
}



