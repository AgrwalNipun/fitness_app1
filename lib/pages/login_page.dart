import 'package:fitness_app/services_firebase/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  Future<String> signUp(WidgetRef ref) async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      print('Enter Mail and password both');
      return "Enter Mail and password both";
    } else {
      final res = await createUserWithMailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
        ref,
      );
      final sol = res.isLeft ? "Success" : res.right.code;
      return sol;
    }
  }

  showSnackBarAfterSignUp(WidgetRef ref) {
    signUp(ref).then(
      (value) => _scaffoldMessengerKey.currentState!.showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.white,
          // padding: EdgeInsets.all(10),
          content: Text(value,style: TextStyle(color: Colors.black),)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/login_bg3.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: SizedBox()),

                Icon(Icons.directions_walk, size: 40, color: Colors.white),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text(
                        "FITTR",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Get Fitter\nEveryday",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Sign UP or Log In to access FITTR.",
                  style: TextStyle(color: Colors.white),
                ),

                Text("Enter Your Email", style: TextStyle(color: Colors.white)),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Enter Your Password",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    showCursor: false,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                    textAlign: TextAlign.center,
                    controller: passwordController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      border: InputBorder.none,
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 20),

                Container(
                  width: MediaQuery.of(context).size.width - 100,

                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(171, 139, 109, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Consumer(
                    builder:
                        (context, ref, child) => TextButton(
                          onPressed: () {
                            showSnackBarAfterSignUp(ref);
                          },
                          child: Center(
                            child: Text(
                              "Sign UP!",
                              style: TextStyle(
                                color: Color.fromRGBO(15, 13, 9, 1),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Already Signed Up? Log In.",
                  style: TextStyle(color: Colors.white),
                ),
                Expanded(flex: 4, child: SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
