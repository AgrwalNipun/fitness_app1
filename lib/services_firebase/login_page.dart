import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/pages/homepage.dart';
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
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/login_bg3.jpg'),
            fit: BoxFit.fitHeight
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: 
            [
              Expanded(
                flex : 2,
                child: SizedBox(),),
            
              Icon(Icons.directions_walk,size: 40,color: Colors.white,),
            Expanded(
              flex : 2,
              child: Column(
                children: [
                  Text("FITTR",
                  style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  Text("Get Fitter\nEveryday",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                ],
              ),),
            Expanded(
              flex:1,
              child:SizedBox()),
              Text("Sign UP or Log In to access FITTR.",style: TextStyle(color: Colors.white),), 
            
            Expanded(
              flex:1,
              child:SizedBox()),  
            Text("Enter Your Email",style: TextStyle(color: Colors.white),),
            Container(
              width:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
            
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: emailController,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),

              )),
            SizedBox(
              height: 20,
            ) ,            
            Text("Enter Your Password",style: TextStyle(color: Colors.white),),
            Container(
              width:MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10)
              ),
              child: TextField(
                showCursor: false,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                controller: passwordController,
                decoration: InputDecoration(
                  border: InputBorder.none
                ),
                obscureText: true,
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
                  
                  if(emailController.text.isEmpty||passwordController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text("!!!!Add Email and Password!!!!")
                      )
                    );
                  }
                  
                  else{
                    // try{
                    //   signInUser(emailController.text.trim(),passwordController.text.trim());
                    // }catch(e){
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                    //   print(e);
                    // }
                    
                      createUserWithMAilAndPassword(emailController.text.trim(),passwordController.text.trim());
                  print("!!!!!!!!!User added!!!!!!!!");
                  }
                  
                }, 
                child:Center(child: Text("Sign UP!",style: TextStyle(
                    color : Color.fromRGBO(15, 13, 9,1)
                  ),),),
            
            
            
                ),
            
               ),
               SizedBox(
              height: 10,
            ) ,
            Text("Already Signed Up? Log In.",style: TextStyle(color: Colors.white),),
            Expanded(
              flex : 2,
              child : SizedBox()
            ),
            ],
          
          ),
        ),
      ),
    );
  }
}