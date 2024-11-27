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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBFkI8XhQ9JKNGVMautJCp96QSnOCxXirA',
    appId: '1:614301456619:web:1b220a207e09c18b0a06ae',
    messagingSenderId: '614301456619',
    projectId: 'demodb-cdb27',
    authDomain: 'demodb-cdb27.firebaseapp.com',
    storageBucket: 'demodb-cdb27.appspot.com',
    measurementId: 'G-ZQBR7H7ECP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClhutXiMp9cpgCVPfzpdKAgN9AnsRRN40',
    appId: '1:614301456619:android:ddfdffe5274d31500a06ae',
    messagingSenderId: '614301456619',
    projectId: 'demodb-cdb27',
    storageBucket: 'demodb-cdb27.appspot.com',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBFkI8XhQ9JKNGVMautJCp96QSnOCxXirA',
    appId: '1:614301456619:web:66c6451af25f5ee00a06ae',
    messagingSenderId: '614301456619',
    projectId: 'demodb-cdb27',
    authDomain: 'demodb-cdb27.firebaseapp.com',
    storageBucket: 'demodb-cdb27.appspot.com',
    measurementId: 'G-QJBPJM704H',
  );
}
