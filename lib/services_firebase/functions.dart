import 'package:firebase_auth/firebase_auth.dart';

void createUserWithMAilAndPassword( String mail, String password) async{

        dynamic inst = FirebaseAuth.instance;
        if(FirebaseAuth.instance.currentUser ==null){
        try {
  inst.createUserWithEmailAndPassword(email: mail, password: password);
} on Exception catch (e) {
  print(e);
  // TODO
}
        print("Current user ${FirebaseAuth.instance.currentUser}");
        }
}
void signInUser(String email,String password)async{
try{
      FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);}
      catch(e){
        print(e);
      }
        
}