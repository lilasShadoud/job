// ignore_for_file: deprecated_member_use, unused_local_variable, await_only_futures, camel_case_types, prefer_const_constructors_in_immutables

// import 'dart:io';
// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/controller/profilecontroller.dart';
import 'package:jobs/model/users.dart';
// import 'package:jobs/utils.dart';
// import 'package:jobs/view/test1.dart';
// import 'package:provider/provider.dart';

import '../../core/size.dart';
import '../../utils.dart';
import '../test1.dart';
// import 'edit.dart';

class updatescreen extends StatefulWidget {
   updatescreen({super.key});

  @override
  State<updatescreen> createState() => _updatescreenState();
}

class _updatescreenState extends State<updatescreen> {  
  Uint8List? _image;
  
  void selectimage()async{
    Uint8List img =await pickImage(ImageSource.gallery);
    setState(() {
      _image=img;
    });

  }
    void saveProfile()async{
     try {
  String resp=await userrepository().saveData(file: _image!);
} on Exception catch (e) {
  print(e);
}
  }
  @override
  Widget build(BuildContext context) {
    
    final controller=Get.put(Profilecontroller());
    return  SafeArea(
      
      child: SizedBox.expand(
        child: Scaffold(
          body: FutureBuilder(
        future: controller.getUserdata(),
            builder:(context, snapshot) {
              if(snapshot.connectionState==ConnectionState.done){
                if(snapshot.hasData){
                  print("ok");
                  User1 userdata=snapshot.data as User1;
                   final name =TextEditingController(text: userdata.name);
                   final email = TextEditingController(text: userdata.email);
                   final password =TextEditingController(text: userdata.password);
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
                  SizedBox(
                    height: Sizeconfig.defaultsize!*5,
                  ),
                  _image!=null?
                  
                  Positioned(
                    // bottom: Sizeconfig.defaultsize!*5,
                    top: Sizeconfig.defaultsize!*5,
                    child:  CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 90,
                      child:CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 88,
                        backgroundImage:MemoryImage(_image!) ,
                          
                      ) ,
                    ),
                
                  ):
                       CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 90,
                          child:CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 88,
                             child:Icon(Icons.person,size: 100,)
                           
                          ) ,
                        ),
                  
                      Positioned(
                    top: Sizeconfig.defaultsize!*17,
                    left: Sizeconfig.defaultsize!*14,
                    child: IconButton(onPressed:(){
                     selectimage();
                    }
                    , icon:  Icon(Icons.add_a_photo,color: Colors.grey[600],size: 30,))),
                ]
                ),
                SizedBox(height: 
                Sizeconfig.defaultsize!*5,)
                ,
                Form(
                  child:
                  Column(
                  children: [
                    TextFormField(
                        style: Theme.of(context).textTheme.headline2,
                     
                      controller: name,
                      // initialValue: userdata.name,
                      decoration: InputDecoration(
                    suffixIconColor: Colors.grey,
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:const Icon(Icons.face),
                    // suffixIcon: IconButton(
                    //                 onPressed: () => nameController.clear(),
                    //                 icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
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
                TextFormField(
                    style: Theme.of(context).textTheme.headline2,
                      controller: email,
                      // initialValue: userdata.email,
                      decoration: InputDecoration(
                    suffixIconColor: Colors.grey,
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:const Icon(Icons.face),
                    // suffixIcon: IconButton(
                    //                 onPressed: () => nameController.clear(),
                    //                 icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
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
                TextFormField(
                    style: Theme.of(context).textTheme.headline2,
                      controller: password,
                      // initialValue: userdata.password,
                      decoration: InputDecoration(
                    suffixIconColor: Colors.grey,
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:const Icon(Icons.face),
                    // suffixIcon: IconButton(
                    //                 onPressed: () => nameController.clear(),
                    //                 icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
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
                ElevatedButton(onPressed: ()async{
                  final userData =User1(
                  email: email.text.trim(),
                  password: password.text.trim(),
                  name: name.text.trim());
                  await controller.updateRecord(userdata);
                  saveProfile();
                  Get.back();
                }, child:Text("Save",style: Theme.of(context).textTheme.headline3,) )
                  ],
                ) )
               

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