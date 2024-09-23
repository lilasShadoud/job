// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:jobs/view/pages/login.dart';
import 'package:jobs/view/pages/page.dart';
import 'package:jobs/view/pages/signup.dart';

class AuthenticationRepositroy extends GetxController{
  static AuthenticationRepositroy get instance => Get.find();

  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser=Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setInitialScreen);
    
  }
  setInitialScreen(User? user){
    user==null? Get.offAll(() => Login()): Get.offAll(()=>Signup());
  }
  Future<void> createUserwithemailandpassword(String email,String password)async{
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(_auth.toString())
;      Get.to(()=>page());
      print("sucess");
    } on FirebaseAuthException catch (e) {
       Get.snackbar("error",e.toString());
    }
  }
   Future<void> loginUserwithemailandpassword(String email,String password)async{
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(AuthenticationRepositroy.instance.firebaseUser);
      Get.to(()=>page());
      print("sucess");
    } on FirebaseAuthException catch (e) {
       Get.snackbar("error",e.toString());
    }
  }
  Future<void> logout()async
   {
   await _auth.signOut();
  Get.to(Login());
  }
} 