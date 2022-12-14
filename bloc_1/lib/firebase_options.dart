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
    apiKey: 'AIzaSyCa8gbRPn4bsRDUMBeX29NrClEASwMi18c',
    appId: '1:771798004880:web:59371d8694605256911415',
    messagingSenderId: '771798004880',
    projectId: 'alarm-38a4d',
    authDomain: 'alarm-38a4d.firebaseapp.com',
    storageBucket: 'alarm-38a4d.appspot.com',
    measurementId: 'G-QQSVT3CKTD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTQnZWB9N89q8oxljj3hgdhokVyyJbNrE',
    appId: '1:771798004880:android:878537f7bf76b3ce911415',
    messagingSenderId: '771798004880',
    projectId: 'alarm-38a4d',
    storageBucket: 'alarm-38a4d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDpCewr1bu_BHnPVZUYH3r7hguipHI684E',
    appId: '1:771798004880:ios:f1b99906e740ab5f911415',
    messagingSenderId: '771798004880',
    projectId: 'alarm-38a4d',
    storageBucket: 'alarm-38a4d.appspot.com',
    iosClientId: '771798004880-f8rrm4j7f56rb1cpv69b1f81ps96df2n.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloc1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDpCewr1bu_BHnPVZUYH3r7hguipHI684E',
    appId: '1:771798004880:ios:f1b99906e740ab5f911415',
    messagingSenderId: '771798004880',
    projectId: 'alarm-38a4d',
    storageBucket: 'alarm-38a4d.appspot.com',
    iosClientId: '771798004880-f8rrm4j7f56rb1cpv69b1f81ps96df2n.apps.googleusercontent.com',
    iosBundleId: 'com.example.bloc1',
  );
}
