import 'package:firebase_auth/firebase_auth.dart';

void signUpWithMAilAndPassword( String mail, String password) async{

        dynamic inst = FirebaseAuth.instance;
        
        inst.createUserWithEmailAndPassword(email: mail, password: password);
        print("Current user ${FirebaseAuth.instance.currentUser}");
}