
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Models/User.dart';

class FireStore
{

  Future CreateUser({
    required String name,
    required String phone,
    required String email,
    required String password,
    required bool li,
    required bool ci,
    required bool ri,

  }) async {
    final docUser = FirebaseFirestore.instance.collection("Paraiba123").doc(name);

    User users = User(name: name,phone: phone,email: email,password: password,li: li,ri: ri,ci: ci);

    await docUser.set(users.toJson());
  }
}