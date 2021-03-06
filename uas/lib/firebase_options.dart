// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDIggqGmyiPWiYa7G04unKX4I1Rhh2YtkE',
    appId: '1:355289536720:web:f14a1263a892137a8da6d5',
    messagingSenderId: '355289536720',
    projectId: 'uasambw-8bba4',
    authDomain: 'uasambw-8bba4.firebaseapp.com',
    storageBucket: 'uasambw-8bba4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTT4V5cP1qAuBwoHZt5Jckn_zLm-6gvBI',
    appId: '1:355289536720:android:db33609a6604a3948da6d5',
    messagingSenderId: '355289536720',
    projectId: 'uasambw-8bba4',
    storageBucket: 'uasambw-8bba4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAZopF1EuyIX0z5bXt_jo2Y_Fin1dIPvdE',
    appId: '1:355289536720:ios:1c802c9e194eae0e8da6d5',
    messagingSenderId: '355289536720',
    projectId: 'uasambw-8bba4',
    storageBucket: 'uasambw-8bba4.appspot.com',
    iosClientId: '355289536720-v6k1ajn5ofb13c0pv7qeejh7fg7r5tnu.apps.googleusercontent.com',
    iosBundleId: 'com.example.uas',
  );
}
