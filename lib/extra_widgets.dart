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
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,     
     children: [
      CircularPercentIndicator(
        radius: 40,
        percent: 0.4,
        lineWidth: 10,
        center:Text("Water")
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
         ),
         SizedBox(
          height: 10,
         ),
         LinearPercentIndicator(
          width : 200,
          percent : 0.30,
          lineHeight: 10,
          leading: Text("Carbs"),
         ),
          SizedBox(
          height: 10,
         ),
         LinearPercentIndicator(
          width : 200,
          percent : 0.70,
          lineHeight: 10,
          leading: Text("Fibers"),
         ),
       ],
     )
    ],);
  }
  
  
}