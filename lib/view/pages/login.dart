// ignore_for_file: deprecated_member_use

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/auth_service.dart';
// import 'package:jobs/view/pages/homepage.dart';
// import 'package:jobs/view/pages/page.dart';
import 'package:jobs/view/pages/signup.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../core/size.dart';
// import 'test.dart';

class Login extends StatefulWidget {
   const Login({super.key});
 

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? name;
    String? email;
   String? password;
  bool isloading=false;
//  final nameController = TextEditingController();
//  final passwordController = TextEditingController();
//  final pphoneController = TextEditingController();
  GlobalKey<FormState>formkey=GlobalKey();
  bool isPasswordVisible =false;
  @override
  Widget build(BuildContext context) {
    Sizeconfig().init(context);
    return ModalProgressHUD(
      inAsyncCall:isloading  ,
      child: SafeArea(
        child:SizedBox.expand(
        child: Form(
           key: formkey,
          child: Scaffold(
           body: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 10.0),
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                 
                 Text("Joby" ,style: Theme.of(context).textTheme.headline1, 
                 ),
                const SizedBox(height: 70,),
                TextFormField(
                  
                  onChanged:(data){
                    name=data;
                  } ,
                  // controller: nameController,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter name';
                            }
                            return null;
                          },
                          style: Theme.of(context).textTheme.headline2,
                  decoration: InputDecoration(
                    
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'name',
                   
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
                  onChanged:(data){
                    email=data;
                  } ,
                  // controller: nameController,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter email';
                            }
                            return null;
                          },
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'enter email',
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
                  onChanged: (data){
                    password=data;
                  },
                  // controller: passwordController,
                  obscureText: isPasswordVisible,
                  validator: (data) {
                            if (data!.isEmpty) {
                              return 'enter password';
                            }
                            return null;},
                  decoration: InputDecoration(
                    hintText: 'enter password',
                    suffixIconColor: Colors.grey,
                    // hoverColor: Colors.red,
                    // filled: true,
                    prefixIconColor: Colors.blue[900],
                    prefixIcon:IconButton(
                                icon: isPasswordVisible
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                                onPressed: () => setState(
                                    () => isPasswordVisible = !isPasswordVisible),
                              ),
                    // suffixIcon: IconButton(
                    //                 onPressed: () => passwordController.clear(),
                    //                 icon:const Icon(Icons.close)),
                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))         
                  ),
                ),
                
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("If you do not have an account",style: Theme.of(context).textTheme.subtitle2,),
                    TextButton(onPressed: ()=>
                    Get.to(const Signup()), child:  Text("Sign up",style: Theme.of(context).textTheme.headline2,))
                  ],
                ),
                TextButton(onPressed: ()async{
                  if (formkey.currentState!.validate()){
                 
                   
                  //     var auth= FirebaseAuth.instance;
                  //  UserCredential user = await  auth.signInWithEmailAndPassword(email: email!, password: password!);
                    // Get.to(() => page()); 
                   AuthenticationRepositroy.instance.loginUserwithemailandpassword(email!, password!);
                   
                  //  print(user.user! .displayName) ;   
                   
                  }
                  else{
                  print('no');}
                }, child: Text('Login',style: Theme.of(context).textTheme.headline3,))
              ],
             ),
           ),
            
          ),
        ),)
      ),
    );
  }
}