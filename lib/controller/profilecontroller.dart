// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/auth_service.dart';
import 'package:jobs/model/users.dart';
import 'package:jobs/view/test1.dart';

class Profilecontroller extends GetxController{
  static Profilecontroller get instance => Get.find();
  final auttrepo=Get.put(AuthenticationRepositroy());
  final userrepo=Get.put(userrepository());
  getUserdata(){
    print("okkk");
    final email= auttrepo.firebaseUser.value?.email;
    if(email!=null){
     return userrepo.getUserDetails(email);
    }
    else{
      Get.snackbar("error", "login to continue");
    }
  }
  updateRecord(User1 user)async{
    print(user.email);
    await userrepo.updateUserRecord(user);
  }

}