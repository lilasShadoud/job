// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/core/size.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  CollectionReference employee = FirebaseFirestore.instance.collection('employee');
  final nameController = TextEditingController();
 final passwordController = TextEditingController();
 final pphoneController = TextEditingController();
 final emailController = TextEditingController();
 final countryController = TextEditingController();
 final sController = TextEditingController();
 final companyController = TextEditingController();
 final anyController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    SizedBox.expand(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: ()
            {
              employee.add({
              'name':nameController.text,
               'email':emailController.text,
               'password':passwordController.text,
               'phone number':pphoneController.text,
               'country':countryController.text,
               "spcializtion":sController.text,
               'companies you have worked for before':companyController.text,
               'any thing':anyController.text,
                
                  });
                Get.back();
              
            }, icon: Icon(Icons.done))
          ],
          backgroundColor: Colors.white10,
          elevation: 0,
          automaticallyImplyLeading: true,
          foregroundColor: Colors.grey,
        ),
        body: 
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: ListView(
            children: [
              SizedBox(
                height: Sizeconfig.defaultsize!*5,
              ),
            
              TextField(
               style: Theme.of(context).textTheme.headline2,
                  controller: nameController,
                  decoration: InputDecoration(
                  
                    hintText: 'name',
                    
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
              TextField(
                 style: Theme.of(context).textTheme.headline2,
                // onSubmitted: (data){
                //   users.add({
                //     'email':data,
                //   });
                // },
                  controller: emailController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'Email',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                TextField(
                //   onSubmitted: (data){
                //   users.add({
                //     'password':data,
                //   });
                // },
                  controller: passwordController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'Password',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                  TextField(
                     style: Theme.of(context).textTheme.headline2,
                //     onSubmitted: (data){
                //   users.add({
                //     'country':data,
                //   });
                // },
                  controller: countryController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'Country',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                TextField(
                   style: Theme.of(context).textTheme.headline2,
                //   onSubmitted: (data){
                //   users.add({
                //     'phone number':data,
                //   });
                // },
                  controller: pphoneController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'phone number',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                TextField(
                   style: Theme.of(context).textTheme.headline2,
                //   onSubmitted: (data){
                //   users.add({
                //     'spcializtion':data,
                //   });
                // },
                  controller: sController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'spcializtion',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                 TextField(
                   style: Theme.of(context).textTheme.headline2,
                //   onSubmitted: (data){
                //   users.add({
                //     'companies you have worked for before':data,
                //   });
                // },
                  controller: companyController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'companies you have worked for before',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                TextField(
                   style: Theme.of(context).textTheme.headline2,
                //   onSubmitted: (data){
                //   users.add({
                //     'Any thing':data,
                //   });
                // },
                  controller: anyController,
                  decoration: InputDecoration(
                    // filled: true,
                    // fillColor: Colors.white,
                    hintText: 'Any thing',
                    // hoverColor: Colors.red,
                    suffixIconColor: Colors.grey,
                    suffixIcon: IconButton(
                                    onPressed: () => nameController.clear(),
                                    icon:const Icon(Icons.close)),
                                     enabledBorder:  const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 11, 66, 150))),
                     border: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 13, 71, 161)))
                                    
                  ),
                ),
                SizedBox(
                  height: Sizeconfig.defaultsize!*2,
                ),
                
            ],
          ),
        ),
      ),
    ));
  }
}