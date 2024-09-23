import 'package:cloud_firestore/cloud_firestore.dart';

class User1 {
  final String? id;
    String name;
    String email;
    String password;
    String? image;
  
  User1( 
    { this.image,
      this.id,
       required this.name,required this.email, required this.password, });
  toJson(){
    return{"name":name,"email":email,"password":password,
    };
  }
  factory User1.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data =document.data()!;
    print(data);
    return User1(
      id:document.id,
      name:data["name"] , 
      email:data ["email"],
       password: data["password"], 
       image: data["image"]
       
      //  phonenumber:data ["phonenumber"], 
      //  country: data["country"], 
      //  spcializtion: data["spcializtion"], 
      //  company: data["company"],
      //   anything: data["anything"]
        );
  }
}