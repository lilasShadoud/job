// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDD2CfSPN_8FBSleVO1dUt1gmGeoVTAdt0',
    appId: '1:991698414266:web:ad81404552b4249a8f7083',
    messagingSenderId: '991698414266',
    projectId: 'jobs-ea66d',
    authDomain: 'jobs-ea66d.firebaseapp.com',
    storageBucket: 'jobs-ea66d.appspot.com',
    measurementId: 'G-177754F9JB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAGtNKkj3MTbDjmEdbkPjcKpeSz58qHYKM',
    appId: '1:991698414266:android:35acdfa28c13a7c08f7083',
    messagingSenderId: '991698414266',
    projectId: 'jobs-ea66d',
    storageBucket: 'jobs-ea66d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBbw1hcIGkHM9u9IIIkowZuchnaLpgHy64',
    appId: '1:991698414266:ios:d896e2d212ac2c218f7083',
    messagingSenderId: '991698414266',
    projectId: 'jobs-ea66d',
    storageBucket: 'jobs-ea66d.appspot.com',
    iosBundleId: 'com.example.jobs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBbw1hcIGkHM9u9IIIkowZuchnaLpgHy64',
    appId: '1:991698414266:ios:d896e2d212ac2c218f7083',
    messagingSenderId: '991698414266',
    projectId: 'jobs-ea66d',
    storageBucket: 'jobs-ea66d.appspot.com',
    iosBundleId: 'com.example.jobs',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDD2CfSPN_8FBSleVO1dUt1gmGeoVTAdt0',
    appId: '1:991698414266:web:e6972cf206d402958f7083',
    messagingSenderId: '991698414266',
    projectId: 'jobs-ea66d',
    authDomain: 'jobs-ea66d.firebaseapp.com',
    storageBucket: 'jobs-ea66d.appspot.com',
    measurementId: 'G-G9CYE97NPR',
  );

}