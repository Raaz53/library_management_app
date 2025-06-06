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
    apiKey: 'AIzaSyDzarOEgJXutvQ3he0fClB7RA9JEiryFJI',
    appId: '1:809130420935:web:2835a67a8bfbbf68746ce2',
    messagingSenderId: '809130420935',
    projectId: 'bookhive-2c7fa',
    authDomain: 'bookhive-2c7fa.firebaseapp.com',
    storageBucket: 'bookhive-2c7fa.firebasestorage.app',
    measurementId: 'G-DCBK72XW22',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAihykJ_eSukf0OimC8Lp09qiF0_xWknr4',
    appId: '1:809130420935:android:1724a2ddd373fb75746ce2',
    messagingSenderId: '809130420935',
    projectId: 'bookhive-2c7fa',
    storageBucket: 'bookhive-2c7fa.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDJC0tBiLh73FsKeKNCr5by56kDPuFmVbk',
    appId: '1:809130420935:ios:a53521ba06e35c33746ce2',
    messagingSenderId: '809130420935',
    projectId: 'bookhive-2c7fa',
    storageBucket: 'bookhive-2c7fa.firebasestorage.app',
    iosBundleId: 'com.example.bookHive',
  );
}
