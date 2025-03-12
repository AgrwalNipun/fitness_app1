import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: InputDecoration(
                border: InputBorder.none
              ),
            )),
          Text("Already Signed Up? Log In.")
          ],
        
        ),
      )),
    );
  }
}