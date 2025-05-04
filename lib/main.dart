import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/services_firebase/firebase_options.dart';
import 'package:fitness_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  // );
  // await uploadToFirebase();
  runApp(ProviderScope(child: MyApp()));
}

// Future<List<dynamic>> loadJsonFromAssets() async {
//   String jsonString = await rootBundle.loadString('lib/assets/data.json');
//   return jsonDecode(jsonString);
// }



// Future<void> uploadToFirebase() async{
//  final firestore = FirebaseFirestore.instance;

//   final data = await loadJsonFromAssets();

  
//     for (var item in data) {
//       await firestore.collection('exercise').add(item);
//     }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(171, 139, 109, 1),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xffe0e0e0),
          selectedLabelStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data != null) {
            return const HomePage();
          } else {
            return const LoginPage(); 
          }
        },
      ),
    );
  }
}
