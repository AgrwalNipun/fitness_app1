import 'package:fitness_app/pages/calisthenics.dart';
import 'package:fitness_app/pages/cardio.dart';
import 'package:fitness_app/pages/weight_training.dart';
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
  LineChartData food_data = LineChartData(lineBarsData: [LineChartBarData()]);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
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
            center: Text("Water"),
            progressColor: Colors.blue.shade700,
            //Icon(Icons.liquor),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LinearPercentIndicator(
                width: 200,
                percent: 0.50,
                lineHeight: 10,
                leading: Text('Protien'),
                trailing: Text("70%"),
              ),
              SizedBox(height: 10),
              LinearPercentIndicator(
                width: 200,
                percent: 0.30,
                lineHeight: 10,
                leading: Text("Carbs"),
                progressColor: Colors.amber,
                trailing: Text("70%"),
              ),
              SizedBox(height: 10),
              LinearPercentIndicator(
                width: 200,
                percent: 0.70,
                lineHeight: 10,
                leading: Text("Fibers"),
                progressColor: Colors.green,
                trailing: Text("70%"),
              ),
            ],
          ),
        ],
      ),
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
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          height: 150,
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 227, 103),
                Color(0xFF00BFFF),
              ],
              
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => WeightTraining()));
            },
            style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weight Training',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                Icon(Icons.arrow_forward_ios_outlined),
              ],
            ),
          ),
        ),

        //////////
        //////////
        ///
        //////
        /////
        ////
        ////
        ////
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          height: 150,
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 227, 103),
                Color(0xFF00BFFF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => Cardio()));
            },
            style: ButtonStyle(splashFactory: NoSplash.splashFactory),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WeightTraining()),
                );
                //////
                ///todo:add new page
              },
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cardio',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        ),
        //////////
        //////////
        ///
        //////
        /////
        ////
        ////
        ////
        Container(
          margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
          height: 150,
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 227, 103),
                Color(0xFF00BFFF),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => WeightTraining()),
                );
                //////
                ///todo:add new page
              },
              style: ButtonStyle(splashFactory: NoSplash.splashFactory),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Calisthenics',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined),
                ],
              ),
            ),
          ),
        
      ],
    );
  }
}
