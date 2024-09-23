import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:jobs/model/users.dart';

class userrepository extends GetxController{
  static userrepository get instance =>Get.find();
  final db=FirebaseFirestore.instance;
  final FirebaseStorage _storage=FirebaseStorage.instance;
 Future<void>createUser(User1 userr)async{
    await db.collection("users").add(userr.toJson()).whenComplete(()  
    =>
      Get.snackbar("success", "you account has been created",
      snackPosition: SnackPosition.BOTTOM,
      ),
    ).catchError((error,StackTrace){
      Get.snackbar("error", "something went error. try again");
      print("error $error");
      
    });
   
    
  }

  Future<User1>getUserDetails(String email)async{
    
      final snapshot=await db.collection("users").where("email",isEqualTo: email).get();
      final userdata=snapshot.docs.map((e) => User1.fromSnapshot(e)).single;
      return userdata;
    }
    Future<void> updateUserRecord (User1 user)async{
    try {
        await db.collection("users").doc(user.id).update(user.toJson());
        print(user.name);
    }on FirebaseException catch (e) {
      print("error1123"+ e.toString());
    }
    }
    
    Future<String>uploadImageToStorage(String childname,Uint8List file )async{
  try {
    Reference ref =_storage.ref().child(childname);
    UploadTask uploadTask=ref.putData(file);
    TaskSnapshot snapshot=await uploadTask;
    String downloadUrl =await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }on FirebaseException catch (e) {
    return(e.toString());
  }
}
Future<String>saveData({required Uint8List file})async{
  String resp="some error Occurred";
try {
  String imageUrl= await uploadImageToStorage("images",file);
  await db.collection("users").add({
    'imageLink':imageUrl
    });
    resp ="sucess";
} catch (e) {
  resp=e.toString() ;
}
return resp;
}
}