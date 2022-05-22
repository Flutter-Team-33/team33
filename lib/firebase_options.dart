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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBQbhrRvrLSdD0nlyGzvhzDA7V8c7MRnMU',
    appId: '1:243990692480:web:253af27948ccbda4b09c65',
    messagingSenderId: '243990692480',
    projectId: 'login-firebase-424a9',
    authDomain: 'login-firebase-424a9.firebaseapp.com',
    storageBucket: 'login-firebase-424a9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAx8isTb5CHielyqTOdY2dANQ0lneQ2bCc',
    appId: '1:243990692480:android:cfe7dc4bcc6cc0ffb09c65',
    messagingSenderId: '243990692480',
    projectId: 'login-firebase-424a9',
    storageBucket: 'login-firebase-424a9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC4mjwZZbNss5IIr8WCA8jPI9usFPR7o40',
    appId: '1:243990692480:ios:84e08f512135ac4bb09c65',
    messagingSenderId: '243990692480',
    projectId: 'login-firebase-424a9',
    storageBucket: 'login-firebase-424a9.appspot.com',
    iosClientId: '243990692480-lhvuve420cq4fedur7abp1426p8q2ipr.apps.googleusercontent.com',
    iosBundleId: 'com.example.team33App',
  );
}