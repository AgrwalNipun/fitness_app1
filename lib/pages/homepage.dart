import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/pages/extra_widgets.dart';
import 'package:fitness_app/pages/login_page.dart';
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
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFE0E0E0),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Train'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Food Log'),
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Profile'),],
      selectedItemColor:const Color.fromARGB(255, 186, 45, 45),
      unselectedItemColor:Colors.white,
      ),

      appBar: defaultAppBar(),

      body: SafeArea
      (
        child:SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text("Your Macros : ",textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  food_chart(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:Text("Let's Start Your Workout !",textAlign: TextAlign.left,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  SelectExercise(),
                  TextButton(onPressed: (){
                    print(FirebaseAuth.instance.currentUser.toString());
                  }, child: Text("HIt ME"))
                ],
              ),
        ),
        )
        
      
    );
  }
}

   AppBar defaultAppBar(){
    return AppBar(
        backgroundColor: const Color(0xFFE0E0E0),
        leading: Icon(Icons.directions_walk,size: 28,),
        title: Text("Fittr",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        elevation: 0,
        actions: [IconButton(onPressed: () async{

          try{
            FirebaseAuth.instance.signOut();
            // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginPage() ));
          }
          catch(e){
            print(e);
          }
        },
         icon: Icon(Icons.exit_to_app))],
      );

   }