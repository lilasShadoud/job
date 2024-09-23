import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobs/auth_service.dart';
import 'package:jobs/core/Localstring.dart';
import 'package:jobs/core/localstrings.dart';
import 'package:jobs/notifcation/notifcation_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:jobs/view/pages/notificationpage.dart';
import 'core/Themes.dart';
import 'firebase_options.dart';
import 'view/pages/login.dart';
SharedPreferences? sharepref;
final navigatorKey=GlobalKey<NavigatorState>();
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform)
    .then((value) => Get.put(AuthenticationRepositroy()));
  await FirebaseApi().initNotificatio();
  await  GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  sharepref =await SharedPreferences.getInstance();
  await FirebaseApi().initNotificatio();
  runApp( MyApp());
}
class InitialBindings extends Bindings {
  @override
  void dependencies() {
    
    // Get.put(locales());
  }
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     locales controller=Get.put(locales());
     
    return  GetMaterialApp(
        initialBinding: InitialBindings(),
      translations: Localstring(),
      locale:controller.intillang,
      theme: Themes.customLighththeme,
      darkTheme: Themes.customDarkhtheme,
      themeMode: ThemeMode.system,
       debugShowCheckedModeBanner: false,
       
       home:const Login(),
       navigatorKey: navigatorKey,
       routes: {
        '/notification-screen':(context) => notificationSScreen()
       },
    );
  }
}
