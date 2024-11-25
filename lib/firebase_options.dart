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
    apiKey: 'AIzaSyBJMUV0wLGYRcoRpz-odLx4SlETJC2u_2E',
    appId: '1:614484823133:web:074674bfcd0f3f98ea11b4',
    messagingSenderId: '614484823133',
    projectId: 'notes-app-fc4d1',
    authDomain: 'notes-app-fc4d1.firebaseapp.com',
    storageBucket: 'notes-app-fc4d1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIUEMUUSGVY0sCMXZOSBhHlDgPulR4FM0',
    appId: '1:614484823133:android:1837e96685a149d3ea11b4',
    messagingSenderId: '614484823133',
    projectId: 'notes-app-fc4d1',
    storageBucket: 'notes-app-fc4d1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-qWmNycYzn1tF95uVqdL-qqXQmt57gfc',
    appId: '1:614484823133:ios:5372e3cb20fe475aea11b4',
    messagingSenderId: '614484823133',
    projectId: 'notes-app-fc4d1',
    storageBucket: 'notes-app-fc4d1.firebasestorage.app',
    iosBundleId: 'com.example.notely',
  );

}