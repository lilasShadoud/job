// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Themes{
  Themes._();
  static ThemeData customDarkhtheme =ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(

    ),
    iconTheme: const IconThemeData(color: Colors.grey),
    // focusColor: Colors.grey,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    
    appBarTheme: const AppBarTheme(color: Colors.grey),
    primaryColor: Colors.grey,
    iconButtonTheme: const IconButtonThemeData(style: ButtonStyle(iconColor:MaterialStatePropertyAll(Colors.grey))),
    textTheme: const TextTheme(
      
      headline1: TextStyle(color: Colors.grey,fontSize: 50,fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.grey,fontSize: 15),
      headline3: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),
      subtitle1: TextStyle(color:Colors.white,fontSize: 20 ),
      subtitle2: TextStyle(color: Colors.white),

      
    )

  );
  static ThemeData customLighththeme =ThemeData(
    
    iconTheme: IconThemeData(color: Colors.blue[600]),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      
       backgroundColor:  Colors.white12,
          //  selectedBackgroundColor:Colors.blue[600],
           
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0XFF1C3132),
    ),
    // focusColor: Colors.black,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.blue[600]),
    primaryColor: Colors.blue[600],
     iconButtonTheme: IconButtonThemeData(style: ButtonStyle(iconColor:MaterialStatePropertyAll(Colors.blue[600]))),
    textTheme:  TextTheme(
      headline1: TextStyle(color: Colors.blue[600],fontSize: 50,fontWeight: FontWeight.bold),
      headline2: TextStyle(color: Colors.blue[600],fontSize: 15),
      headline3: TextStyle(color: Colors.blue[600],fontSize: 20,fontWeight: FontWeight.bold),
      subtitle1: const TextStyle(color:Colors.white,fontSize: 20 ),
      subtitle2: const TextStyle(color: Colors.black),

  ),);
}