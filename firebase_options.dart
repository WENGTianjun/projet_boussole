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
    apiKey: 'AIzaSyBkA2VKKLc5RIK2PEIDX6ieLpIgfbhUdbY',
    appId: '1:557807026604:web:2bbdc357171657314ffa09',
    messagingSenderId: '557807026604',
    projectId: 'boussole-l3o1',
    authDomain: 'boussole-l3o1.firebaseapp.com',
    storageBucket: 'boussole-l3o1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBMfBTNC227Ba5sqWVTC9Ux9_zZ4p0gvzc',
    appId: '1:557807026604:android:07ef880ec283d14b4ffa09',
    messagingSenderId: '557807026604',
    projectId: 'boussole-l3o1',
    storageBucket: 'boussole-l3o1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeGy1h3jcX1L1H7APi1cNKs39w8Cxzev8',
    appId: '1:557807026604:ios:c4b0cae4380392554ffa09',
    messagingSenderId: '557807026604',
    projectId: 'boussole-l3o1',
    storageBucket: 'boussole-l3o1.appspot.com',
    iosClientId: '557807026604-rocopeb42cienf3gj6v6u4nhsseq332l.apps.googleusercontent.com',
    iosBundleId: 'com.example.boussole',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeGy1h3jcX1L1H7APi1cNKs39w8Cxzev8',
    appId: '1:557807026604:ios:c4b0cae4380392554ffa09',
    messagingSenderId: '557807026604',
    projectId: 'boussole-l3o1',
    storageBucket: 'boussole-l3o1.appspot.com',
    iosClientId: '557807026604-rocopeb42cienf3gj6v6u4nhsseq332l.apps.googleusercontent.com',
    iosBundleId: 'com.example.boussole',
  );
}
