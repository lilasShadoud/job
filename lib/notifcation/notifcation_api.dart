import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
import 'package:jobs/main.dart';
// import 'package:jobs/view/pages/notificationpage.dart';
Future<void> handleBackgroundMessagec(RemoteMessage message)async{
  print("title :${message.notification?.title}");
  print("body :${message.notification?.body}");
  print("payload :${message.data}");
}
class FirebaseApi{
  final _firebasemessaging=FirebaseMessaging.instance;
  void handleMessage(RemoteMessage? message){
    if(message==null)
    return;
    navigatorKey.
    currentState?.pushNamed('/notification-screen',arguments: message);
    
  }
  Future initPushNotification()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessagec);
  }
  Future<void> initNotificatio()async{
    await _firebasemessaging.requestPermission();
    final fCMToken=await _firebasemessaging.getToken();
    print("token : $fCMToken");
    initPushNotification();
  }
}