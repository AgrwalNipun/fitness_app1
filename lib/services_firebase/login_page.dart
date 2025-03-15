import 'package:fitness_app/homepage.dart';
import 'package:fitness_app/services_firebase/functions.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Colors.yellow.shade800,
              Colors.yellow.shade700,
            Colors.yellow.shade600,
           Colors.yellow.shade500, 
          
          ],
        ),
      ),
      child: Scaffold(
        body: SafeArea(child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Expanded(
                flex : 1,
                child: SizedBox(),),
      
              Icon(Icons.directions_walk,size: 40,),
            Expanded(
              flex : 2,
              child: Column(
                children: [
                  Text("FITTR.",
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),
                  ),
                  Text("Get Fitter\nEveryday",style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),),
            
              Text("Enter Your Email"),
            Container(
              width:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
      
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              )),
      SizedBox(
              height: 20,
            ) ,            
            Text("Enter Your Password"),
            Container(
              width:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
              )),
            SizedBox(
              height: 20,
            ) ,
             
             Container(
                      width : MediaQuery.of(context).size.width-100,
                      
                    height : 50,
                    decoration: BoxDecoration(
                      
                      color: Color.fromRGBO(171 , 139, 109, 1),
                      borderRadius: BorderRadius.circular(20)
      ),
                  child :  TextButton(
                onPressed: (){
                  signUpWithMAilAndPassword(emailController.text.trim(),passwordController.text.trim());
                  print("!!!!!!!!!User added!!!!!!!!");
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: 
                  (context)=>HomePage()
                  ));
                }, 
                child:Center(child: Text("Sign UP!",style: TextStyle(
                    color : Color.fromRGBO(15, 13, 9,1)
                  ),),),
      
      
      
                ),
      
               ),
               SizedBox(
              height: 10,
            ) ,
            Text("Already Signed Up? Log In.",),
            Expanded(
              flex : 2,
              child : SizedBox()
            ),
            ],
          
          ),
        )),
      ),
    );
  }
}