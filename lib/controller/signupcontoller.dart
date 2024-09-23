import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/auth_service.dart';
import 'package:jobs/model/users.dart';
import 'package:jobs/view/test1.dart';

class Signupcontroller extends GetxController{
  static Signupcontroller get intance => Get.find();
  final email =TextEditingController();
  final name =TextEditingController();
  final password =TextEditingController();
  final userRepo=Get.put(userrepository());
void register (String name,String email , String password){
  AuthenticationRepositroy.instance.createUserwithemailandpassword(email, password);
}
void createuser(User1 userr)async{
 await userRepo.createUser(userr);
}
}