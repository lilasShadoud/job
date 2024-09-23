// ignore_for_file: unnecessary_import, camel_case_types, deprecated_member_use, avoid_print

// import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
// import 'package:jobs/core/Themes.dart';

// import 'core/size.dart';
import 'widget/addjob.dart';

class test extends StatefulWidget {
  const test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {
  bool isSaveVisible =false;
   List allresults=[];
  List resultlist=[];
  final TextEditingController searchresult1=TextEditingController();
  final TextEditingController searchresult2=TextEditingController();
  final TextEditingController searchresult3=TextEditingController();
  @override
  void initState() {
    // getResluts();
    searchresult1.addListener(onsearcchanges);
    super.initState();
  }
  onsearcchanges(){
    print(searchresult1.text);
    searchresullist();
  }
  searchresullist(){
    var showresult=[];
    if(searchresult1.text!=""){
      for( var searchsnapshot in allresults  ){
        var jobname =searchsnapshot['jobname'].toString().toLowerCase();
        var jobtype =searchsnapshot['jobtype'].toString().toLowerCase();
        var counyrt =searchsnapshot['country'].toString().toLowerCase();
        if (jobname.contains(searchresult1.text.toLowerCase()) || jobtype.contains(searchresult1.text.toLowerCase()) || counyrt.contains(searchresult1.text.toLowerCase())) {
          showresult.add(searchsnapshot);
        }
      }
    }
    else{
      showresult=List.from(allresults);
    }
    setState(() {
      resultlist=showresult;
    });
  }
  getResluts()async{
    var data = await FirebaseFirestore.instance.collection('company').orderBy('jobname').get();
    setState(() {
      allresults=data.docs;
    });
    searchresullist();
  }
  @override
  void dispose() {
    searchresult1.removeListener(onsearcchanges);
    searchresult1.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    getResluts();
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    SizedBox.expand(
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              height: 250,
              color: Theme.of(context).primaryColor,
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                    children: [
                      IconButton(onPressed: (){
                        Get.back();
                      }, icon: const Icon(Icons.arrow_back),color: Colors.white,),
                       Text("Search Jobs",style:Theme.of(context).textTheme.subtitle1 ),
                      const IconButton(onPressed: 
                      null, icon: Icon(Icons.menu))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20.0),
                    child: TextFormField(
                       style: Theme.of(context).textTheme.headline2,
                      controller: searchresult1,
                      
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.white
                        ,
                        hintText: 'Prodect designer',
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
                  ),
                  
                ],
              ),
            ),
            ListView.builder(
              
                    scrollDirection: Axis.vertical,
            shrinkWrap: true,
                    itemCount: resultlist.length,
                    itemBuilder: (context,index){
                      return  ListTile(
                  leading: const Icon(Icons.work,size: 40,),
                  title: Text(resultlist[index]['jobname'],style: const TextStyle(color: Colors.grey, fontSize: 20,fontWeight: FontWeight.bold),),
                  subtitle: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Text(resultlist[index]['companyname'],style: const TextStyle(fontSize: 15),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(resultlist[index]['country'],style: const TextStyle(fontSize: 15),),
                          Text(resultlist[index]['jobtype'],style: const TextStyle(fontSize: 15),),
                          Text(resultlist[index]['job'],style: const TextStyle(fontSize: 15),)
                        ],
                      )
                    ],
                  ),
                  trailing:Addjob());

                    }
                  )
          ],
        ),
      ),
    ));
  }
}