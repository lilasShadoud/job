// ignore_for_file: deprecated_member_use, unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobs/controller/signupcontoller.dart';
import 'package:jobs/model/users.dart';
import 'package:jobs/utils.dart';
import 'package:jobs/view/pages/login.dart';
import 'package:jobs/view/test1.dart';
// import 'package:jobs/view/pages/homepage.dart';
// import 'package:jobs/view/pages/page.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/size.dart';
// import 'test.dart';

class Signup extends StatefulWidget {
   const Signup({super.key});
 

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Uint8List? _image;
  
  void selectimage()async{
    Uint8List img =await pickImage(ImageSource.gallery);
    setState(() {
      _image=img;
    });
  
  }
  void saveProile()async{
   
    try {
  String resp=await userrepository().saveData(file: _image!);
} on Exception catch (e) {
print(e);
}
  }
   late String email;
  late String password;
  bool isloading=false;
//  final nameController = TextEditingController();
//  final passwordController = TextEditingController();
//  final pphoneController = TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey();
  bool isPasswordVisible =false;
  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    final controller =Get.put(Signupcontroller());
    return ModalProgressHUD(
      inAsyncCall:isloading  ,
      child: SafeArea(
        child:SizedBox.expand(
        child: Form(
           key: formkey,
          child: Scaffold(
           body: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: ListView(
              scrollDirection: Axis.vertical,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 Center(child: Text("Joby" ,style: Theme.of(context).textTheme.headline1)),
                const SizedBox(height: 50,),
                 Center(
                   child: Stack(
                     children: [
                      _image!=null?
                       Positioned(
                          // top: Sizeconfig.defaultsize!*2,
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
                              child: Icon(Icons.person,size: 100,)
                             
                            ) ,
                          ),
                        
                            Positioned(
                          top: Sizeconfig.defaultsize!*14,
                          left: Sizeconfig.defaultsize!*12,
                          child: IconButton(onPressed:(){
                           selectimage();
                          }
                          , icon:  Icon(Icons.add_a_photo,color: Colors.grey,size: 30,))),
                     ],
                   ),
                 ),
                  SizedBox(
                    height: Sizeconfig.defaultsize!*2,
                  ),
                 TextFormField(
                   style: Theme.of(context).textTheme.headline2,
             
                  // onChanged: (data){
                  //   password=data;
                  // },
                  controller: controller.name,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter name';
                            }
                            return null;
                          },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'enter name',
                    // hoverColor: Colors.red,
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
                const SizedBox(height: 10,),
                TextFormField(
                   style: Theme.of(context).textTheme.headline2,
                  // onChanged: (data){
                  //   email=data;
                  // },
                  controller: controller.email,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter email';
                            }
                            return null;
                          },
                  decoration: InputDecoration(
                   
                    hintText: 'enter email',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:const Icon(Icons.face),
                   
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                   style: Theme.of(context).textTheme.headline2,
                  
                  controller: controller.password,
                  
                  obscureText: isPasswordVisible,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter password';
                            }
                            return null;},
                  decoration: InputDecoration(
                    
                    hintText: 'enter password',
                    suffixIconColor: Colors.grey,
                   
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:IconButton(
                                icon: isPasswordVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () => setState(
                                    () => isPasswordVisible = !isPasswordVisible),
                              ),
                   
                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))         
                  ),
                ),
                const SizedBox(height: 10,),
              
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("If you have an account",style: Theme.of(context).textTheme.subtitle2,),
                    TextButton(onPressed: ()=>
                    Get.to(()=>Login()), child: Text("Login",style: Theme.of(context).textTheme.headline2,))
                  ],
                ),
                TextButton(onPressed: ()async{
                  if (formkey.currentState!.validate()){
                    Signupcontroller.intance.register(controller.name.text.trim(),controller.email.text.trim(), controller.password.text.trim());
                    final user =User1(name: controller.name.text.trim(), email: controller.email.text.trim(), password: controller.password.text.trim());  
                     Signupcontroller.intance.createuser(user);
                      // saveProile();
                  }
                }, child: Text('Sign up',style: Theme.of(context).textTheme.headline3,))
              ],
             ),
           ),
            
          ),
        ),)
      ),
    );
  }
}