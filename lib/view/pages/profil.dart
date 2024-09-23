// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart'
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:jobs/controller/profilecontroller.dart';
import 'package:jobs/model/users.dart';
// import 'package:jobs/utils.dart';
import 'package:jobs/view/pages/update_Screen.dart';
// import 'package:provider/provider.dart';

import '../../core/size.dart';
// import 'edit.dart';

class profil extends StatefulWidget {
   profil({super.key});

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
 
  
  @override
  Widget build(BuildContext context) {
    
    final controller=Get.put(Profilecontroller());
    return  SafeArea(
      
      child: SizedBox.expand(
        child: Scaffold(
          body: FutureBuilder(
        future: controller.getUserdata(),
            builder:(context,snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                
                  print("ok");
                  User1 userdata=snapshot.data as User1;
                  
            return ListView(
              
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: 
                  [
                    Container(
                    color: Theme.of(context).primaryColor,
                    height: Sizeconfig.defaultsize!*20,
                  ),
               
                    Positioned(
                    top: Sizeconfig.defaultsize!*5,
                    child:  CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 90,
                      child:CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 88,
                        child:Icon(Icons.person,size: 100,)
                        
                      ) ,
                    ),
                    
                  ),
                  Positioned(
                    left: Sizeconfig.defaultsize!*20,
                    top: Sizeconfig.defaultsize!*15,
                    child: Text(userdata.name,style: Theme.of(context).textTheme.subtitle1),),
                    
                    Positioned(child: 
                    IconButton(onPressed: () =>Get.to(()=> updatescreen())
                     ,icon: Icon(Icons.edit,color:Colors.grey[600]))
                    )
                ]
                ),
                SizedBox(height: 
                Sizeconfig.defaultsize!*5,)
                ,
                ListTile(
                  
                   title: const Text("your email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                   subtitle: Text(userdata.email,style: TextStyle(fontSize: 15,color: Colors.blue[600])),
                ),
                
               Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: Sizeconfig.defaultsize!*1,
                  endIndent: Sizeconfig.defaultsize!*2,
                ),
                SizedBox(height: 
                Sizeconfig.defaultsize!*2,)
                ,
                ListTile(
  
                   title: const Text("password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                   subtitle: Text(userdata.password,style: TextStyle(fontSize: 15,color: Colors.blue[600])),
                ),
               Divider(
                  color: Colors.grey,
                  thickness: 1,
                  indent: Sizeconfig.defaultsize!*1,
                  endIndent: Sizeconfig.defaultsize!*2,
                ),
                 SizedBox(height: 
                Sizeconfig.defaultsize!*2,),

              ],
            );}
            else if (snapshot.hasError){
              return Center(child: Text(snapshot.error.toString()),);
            }
            else{ return   Center(child: Text("some thing went wrong"),);}}
            else{
              return Text("noo");
            }
            }
          ),
        ),
      ),
    );
     
  }
}