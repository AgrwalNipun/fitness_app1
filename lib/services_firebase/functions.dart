import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Either<UserModel,FirebaseAuthException>> createUserWithMailAndPassword(String mail,String password,WidgetRef ref)async{

try{
final firestore = FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
   final  credentials = await auth.createUserWithEmailAndPassword(email: mail,password: password);
  final User? user = credentials.user;  
  final uid = user!.uid;
  final userModel = ref.read(userModelProvider).copyWith(
  email: mail,
  uid :uid,
);
  firestore.collection("users").add(userModel.toMap());
return Left(userModel);


}on FirebaseAuthException catch (e){
  return Right(e);
}
}

void signInUser(String email, String password) async {
  try {
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print(e);
  }
}
