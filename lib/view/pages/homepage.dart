// import 'package:flutter/foundation.dart';
// ignore_for_file: unnecessary_import, sort_child_properties_last
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jobs/core/size.dart';
// import 'package:jobs/model/jobs.dart';
// import 'package:jobs/view/pages/edit.dart';
import 'package:jobs/widget/addjob.dart';
// import 'package:jobs/model/jobs.dart';

import '../../test.dart';
// import '../option.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
//  List<String>text=['Lebanon','USA','Italy'];

class _HomeState extends State<Home> {
  // bool isSaveVisible =false;

  List<QueryDocumentSnapshot> data=[];
  getdata()async{
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('company').get();
  data.addAll(querySnapshot.docs);
  setState(() {
    
  });
  }
  @override
  void initState() {
    getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: 
    SizedBox.expand(
      child: Scaffold(
        // backgroundColor: t,
        body: ListView(
          
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight: Radius.circular(40))
              ),
              height: 270,
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("    Hello ", style:Theme.of(context).textTheme.subtitle1,),
                        Text("    Let\'s Find you your Dream job",style:Theme.of(context).textTheme.subtitle1,)
                      ],
                     ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: TextFormField(
                      onTap: ()=> Get.to(()=>const test()),
                      
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.white
                        ,
                        hintText: 'Search Job',
                        hintStyle: const TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.white30,
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                          color: Colors.white30
                        )),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
             SizedBox(
                    height: Sizeconfig.defaultsize!*2,
                  ),
               Container(
                     margin: EdgeInsets.only(left:Sizeconfig.defaultsize!*2,top: Sizeconfig.defaultsize!*1),
                 width: double.maxFinite,
                   height: Sizeconfig.defaultsize!*50, 
                  //  color: Colors.white70, 
                   child: ListView.builder( 
                    
                         itemCount: data.length,
                           scrollDirection: Axis.vertical,
                           itemBuilder: (context, index) {
                             return  Column(
      children: [
        Container(
          child:Padding(
            padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 15),
            child: ListTile(
              leading: const Icon(Icons.medication,size: 40,),
              title: Text("${data[index]['jobname']}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Text("${data[index]['companyname']}",style: const TextStyle(fontSize: 15),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("${data[index]['country']}",style: const TextStyle(fontSize: 15),),
                      Text("${data[index]['jobtype']}",style: const TextStyle(fontSize: 15),),
                      Text("${data[index]['job']}",style: const TextStyle(fontSize: 15),)
                    ],
                  )
                ],
              ),
              trailing:Addjob()
              //  
                                  ),
          ),
          
          height: Sizeconfig.defaultsize!*12,
          width: Sizeconfig.defaultsize!*38,
          decoration: BoxDecoration(
            
            color: const Color.fromARGB(255, 226, 225, 225),
          borderRadius: BorderRadius.circular(30),
                  
          
        ),),
        SizedBox(
          height: Sizeconfig.defaultsize!*1,
        )
      ],
    );
                           }),
                 ),
                  
                 
            
          ],
        ),
      ),
    ));
        }
        
       
     
    
  
}