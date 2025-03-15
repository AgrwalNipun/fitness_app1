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
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 252, 252),
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [Text("Enter Your Name"),
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
          Text("Enter Your Email"),
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
          Text("Already Signed Up? Log In.",)
          ],
        
        ),
      )),
    );
  }
}