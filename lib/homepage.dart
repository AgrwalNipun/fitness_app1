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
      backgroundColor: const Color.fromARGB(182, 129, 193, 243),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Train'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Food Log'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Profile'),],
      selectedItemColor:const Color.fromARGB(255, 186, 45, 45),
      unselectedItemColor:Colors.white,
      ),

      appBar: AppBar(leading: Icon(Icons.directions_walk,size: 28,),
      title: Text("Fittr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),


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