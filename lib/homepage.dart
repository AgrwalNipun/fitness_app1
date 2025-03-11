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


    );
  }
}