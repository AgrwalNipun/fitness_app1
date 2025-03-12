import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: const Color.fromARGB(255, 137, 178, 250),
          selectedLabelStyle: TextStyle(color:Colors.white,fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(color:Colors.white),
        )
      ),
      home: const HomePage(),
    );
  }
}
