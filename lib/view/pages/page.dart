import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
// import 'package:jobs/test.dart';
import 'package:jobs/view/pages/homepage.dart';
import 'package:jobs/view/pages/setting.dart';
// import 'package:jobs/view/pages/update_Screen.dart';

import 'profil.dart';

class page extends StatefulWidget {
  const page({super.key});
  
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  int selectedindex = 0;
  final screens=[const Home(),profil(),const Setting()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
       bottomNavigationBar: 
        
        FloatingNavbar(
          // elevation: 5,
          backgroundColor:  Colors.white12,
           selectedBackgroundColor:Colors.grey[600],
           
          unselectedItemColor: Colors.grey,
          selectedItemColor:  Colors.grey[900],
          onTap: (int val) {
            setState(() {
        selectedindex = val;
            });
          },
          currentIndex: selectedindex,
          items: [
            FloatingNavbarItem(
        icon: Icons.home,
        
            ),
            FloatingNavbarItem(
        icon: Icons.person,
            ),
            FloatingNavbarItem(
        icon: Icons.settings,)
          ],
        ),
    );
  }
}