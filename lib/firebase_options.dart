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
    apiKey: 'AIzaSyAWnDgNZqh69cIWkPHJ_Lhx_itY3H2iAQs',
    appId: '1:891033712820:web:d0632744d4364422c27fe1',
    messagingSenderId: '891033712820',
    projectId: 'movies-app-f73cd',
    authDomain: 'movies-app-f73cd.firebaseapp.com',
    storageBucket: 'movies-app-f73cd.appspot.com',
    measurementId: 'G-KJ21K7PD90',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIwlGc7Wo1um1lC4SrRlbtKknYRvgOSeI',
    appId: '1:891033712820:android:5ae051435c5e12c5c27fe1',
    messagingSenderId: '891033712820',
    projectId: 'movies-app-f73cd',
    storageBucket: 'movies-app-f73cd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpToaqI3_CsufOUiTYF6Xl9xyCfLK3umI',
    appId: '1:891033712820:ios:44a0cfbcf3425e42c27fe1',
    messagingSenderId: '891033712820',
    projectId: 'movies-app-f73cd',
    storageBucket: 'movies-app-f73cd.appspot.com',
    iosBundleId: 'com.example.moviesApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpToaqI3_CsufOUiTYF6Xl9xyCfLK3umI',
    appId: '1:891033712820:ios:9dd3eaa44436206fc27fe1',
    messagingSenderId: '891033712820',
    projectId: 'movies-app-f73cd',
    storageBucket: 'movies-app-f73cd.appspot.com',
    iosBundleId: 'com.example.moviesApp.RunnerTests',
  );
}
