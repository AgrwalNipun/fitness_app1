// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userModelProvider = Provider((ref) {
  return UserModel('','', 0, 0, 0, '');
});


class UserModel {
final String uid;
final String email;
final double height;
final double weight;
final int age;
final String gender;

  UserModel(
    this.uid,
     this.email,
     this.height,
     this.weight,
     this.age,
     this.gender,
  );




  UserModel copyWith({
    String? uid,
    String? email,
    double? height,
    double? weight,
    int? age,
    String? gender,
  }) {
    return UserModel(
      uid ?? this.uid,
      email ?? this.email,
      height ?? this.height,
      weight ?? this.weight,
      age ?? this.age,
      gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'height': height,
      'weight': weight,
      'age': age,
      'gender': gender,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['uid'] as String,
      map['email'] as String,
      map['height'] as double,
      map['weight'] as double,
      map['age'] as int,
      map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(uid: $uid, email: $email, height: $height, weight: $weight, age: $age, gender: $gender)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.email == email &&
      other.height == height &&
      other.weight == weight &&
      other.age == age &&
      other.gender == gender;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      email.hashCode ^
      height.hashCode ^
      weight.hashCode ^
      age.hashCode ^
      gender.hashCode;
  }
}
