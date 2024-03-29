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
    apiKey: 'AIzaSyAzKyBhIWALSaLdaYwxf8o6gy37WiEkS_8',
    appId: '1:685780463583:web:b0bee770fd123a172e9e6a',
    messagingSenderId: '685780463583',
    projectId: 'flornanda-2c990',
    authDomain: 'flornanda-2c990.firebaseapp.com',
    storageBucket: 'flornanda-2c990.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABEvjvYOURZY8uEVjYFlc6rTHsEEoIqbk',
    appId: '1:685780463583:android:2635efc572ab9e4b2e9e6a',
    messagingSenderId: '685780463583',
    projectId: 'flornanda-2c990',
    storageBucket: 'flornanda-2c990.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtUXzI0CAmfUX2ywnwkqEpe2hTZJ_pBvs',
    appId: '1:685780463583:ios:c11123d6fb3ebf392e9e6a',
    messagingSenderId: '685780463583',
    projectId: 'flornanda-2c990',
    storageBucket: 'flornanda-2c990.appspot.com',
    iosBundleId: 'com.example.flornanda',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtUXzI0CAmfUX2ywnwkqEpe2hTZJ_pBvs',
    appId: '1:685780463583:ios:2ed49e99b572f5552e9e6a',
    messagingSenderId: '685780463583',
    projectId: 'flornanda-2c990',
    storageBucket: 'flornanda-2c990.appspot.com',
    iosBundleId: 'com.example.flornanda.RunnerTests',
  );
}
