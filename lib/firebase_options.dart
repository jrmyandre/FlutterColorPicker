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
    apiKey: 'AIzaSyBsFXbfeC54Bzxm2qQP-zkUyXJ1sa2UyJY',
    appId: '1:115377185776:web:5002a43ba8f2a16ec4b335',
    messagingSenderId: '115377185776',
    projectId: 'smart-mirror-4f0dd',
    authDomain: 'smart-mirror-4f0dd.firebaseapp.com',
    databaseURL: 'https://smart-mirror-4f0dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-mirror-4f0dd.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCKgIPGxmkOqnsPX-3r4jnpY6o082KkCEY',
    appId: '1:115377185776:android:ef2d159c6a400861c4b335',
    messagingSenderId: '115377185776',
    projectId: 'smart-mirror-4f0dd',
    databaseURL: 'https://smart-mirror-4f0dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-mirror-4f0dd.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCrO8OMnxz6NTE2UlvJnfy-W2FwOJT2xp0',
    appId: '1:115377185776:ios:ceff6fab519258e1c4b335',
    messagingSenderId: '115377185776',
    projectId: 'smart-mirror-4f0dd',
    databaseURL: 'https://smart-mirror-4f0dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-mirror-4f0dd.appspot.com',
    iosBundleId: 'com.example.ledColorPicker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCrO8OMnxz6NTE2UlvJnfy-W2FwOJT2xp0',
    appId: '1:115377185776:ios:ceff6fab519258e1c4b335',
    messagingSenderId: '115377185776',
    projectId: 'smart-mirror-4f0dd',
    databaseURL: 'https://smart-mirror-4f0dd-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'smart-mirror-4f0dd.appspot.com',
    iosBundleId: 'com.example.ledColorPicker',
  );
}
