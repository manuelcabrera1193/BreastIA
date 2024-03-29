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
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        return linux;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCFxyLhM2IbmQ5iLyWFvVfKu2Lir17oKis',
    appId: '1:248928186672:web:ce9d6ff3ab3eb3e0ee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    authDomain: 'breastia-a1daf.firebaseapp.com',
    storageBucket: 'breastia-a1daf.appspot.com',
    measurementId: 'G-K4CK6NB532',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRBLDrSJkKiQXH_OqMOWMYugrA_tLLXng',
    appId: '1:248928186672:android:9d30e6b6694d8743ee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    storageBucket: 'breastia-a1daf.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqb36JpF0LlzGPwGp6Sex0ApuiaSVJTWI',
    appId: '1:248928186672:ios:e6989daed705506dee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    storageBucket: 'breastia-a1daf.appspot.com',
    iosClientId: '248928186672-mn79bbaghvcnemn82ibptioso53uorek.apps.googleusercontent.com',
    iosBundleId: 'com.example.breastIa',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqb36JpF0LlzGPwGp6Sex0ApuiaSVJTWI',
    appId: '1:248928186672:ios:e6989daed705506dee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    storageBucket: 'breastia-a1daf.appspot.com',
    iosClientId: '248928186672-mn79bbaghvcnemn82ibptioso53uorek.apps.googleusercontent.com',
    iosBundleId: 'com.example.breastIa',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCFxyLhM2IbmQ5iLyWFvVfKu2Lir17oKis',
    appId: '1:248928186672:web:12a3e8ec1105276fee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    authDomain: 'breastia-a1daf.firebaseapp.com',
    storageBucket: 'breastia-a1daf.appspot.com',
    measurementId: 'G-RJJSN4J0CY',
  );

  static const FirebaseOptions linux = FirebaseOptions(
    apiKey: 'AIzaSyCFxyLhM2IbmQ5iLyWFvVfKu2Lir17oKis',
    appId: '1:248928186672:web:7fedb02e94c569a9ee58f5',
    messagingSenderId: '248928186672',
    projectId: 'breastia-a1daf',
    authDomain: 'breastia-a1daf.firebaseapp.com',
    storageBucket: 'breastia-a1daf.appspot.com',
    measurementId: 'G-KWP1JHE4DN',
  );
}
