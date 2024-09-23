import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class notificationSScreen extends StatelessWidget {
   notificationSScreen({Key? key}) :super(key: key);
// static const route ='/notification-screen';
  @override
  Widget build(BuildContext context) {
    final message =ModalRoute.of(context)!.settings.arguments as RemoteMessage;
    return SafeArea(child: 
    SizedBox.expand(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('${message.notification?.title.toString()}'),
              Text('${message.notification?.body.toString()}'),
              Text('${message.data.toString()}')
            ],
          ),
        ),
      ),
    ));
  }
}