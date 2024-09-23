
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/auth_service.dart';
import 'package:jobs/core/localstrings.dart';


import '../../core/size.dart';




class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool status =true;
  bool status1 =false;
  @override
  Widget build(BuildContext context) {
    locales controllerlan=Get.find();
    // var isDark =MediaQuery.of(context).platformBrightness==Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        // bottom: pref,
        automaticallyImplyLeading: false,
        title: Text("16".tr ,style: Theme.of(context).textTheme.subtitle1),
      ) ,
        body: 
            Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
    
                SwitchListTile(
                  // inactiveThumbColor: const Color(0XFF1C3132),
                  // activeColor:const Color(0xFFFFA44E) ,
                  title: Text("19".tr ,style: TextStyle(fontSize: Sizeconfig.defaultsize!*2,color: Colors.grey),),
                  value:status1, onChanged: (val){
                  setState(() {
                    
                    status1=val;
                    if(status1){
          controllerlan.chanlang("ar");
        }
        else{
           controllerlan.chanlang("en");
        }
                    // Get.changeTheme(Themes.customLighththeme);
                  });
                }),
                TextButton(onPressed: ()async{
                  AuthenticationRepositroy.instance.logout();
                }, child: Text("Sign out",style:Theme.of(context).textTheme.headline3),)
              ],
            )
          
    );
  }
}