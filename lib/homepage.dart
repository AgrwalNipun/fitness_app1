import 'package:fitness_app/extra_widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),label: 'Home',),
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black),label: 'Train'),
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black),label: 'Food Log'),
      BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black),label: 'Profile'),],),


      body: SafeArea
      (
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text("Your Macros : ",textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              food_chart(),
            ],
          )
        
      ),
    );
  }
}