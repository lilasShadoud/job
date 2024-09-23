import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/pages/edit.dart';

class Addjob extends StatefulWidget {
  const Addjob({super.key});

  @override
  State<Addjob> createState() => _AddjobState();
}

class _AddjobState extends State<Addjob> {
  bool isSaveVisible =false;
  int count =0;
  @override
  Widget build(BuildContext context) {
     if (count==0) {
      return IconButton(

        icon:
     
                                   
                                   const Icon(Icons.turned_in_not,size: 30,),
                              onPressed: () => setState(
                                  () {
                                    count++;
                                   
                                  Get.to(edit());}),);
    }
    else{
      return  IconButton(
        icon:
               
                                   const Icon(Icons.turned_in,size: 30,),
                              onPressed: () => setState(
                                  () {
                                    count--;
                                   
                                 }),);
    }
  }
}