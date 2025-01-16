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
        return macos;
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
    apiKey: 'AIzaSyDF7UndLudus1yoj4FvK1-LusiC_ROV9KU',
    appId: '1:544237746059:web:2f1aa49dd74c0573b5218e',
    messagingSenderId: '544237746059',
    projectId: 'firecars-98ddb',
    authDomain: 'firecars-98ddb.firebaseapp.com',
    storageBucket: 'firecars-98ddb.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlB2G_o1X10ykjXe9j2tZThiw678LZpbM',
    appId: '1:544237746059:android:dd53c371f5045e84b5218e',
    messagingSenderId: '544237746059',
    projectId: 'firecars-98ddb',
    storageBucket: 'firecars-98ddb.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUte3csTBnvqXMuskCY8L86as5-cPLnqQ',
    appId: '1:544237746059:ios:23177266d6cb353bb5218e',
    messagingSenderId: '544237746059',
    projectId: 'firecars-98ddb',
    storageBucket: 'firecars-98ddb.firebasestorage.app',
    iosBundleId: 'com.example.fireCars',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDUte3csTBnvqXMuskCY8L86as5-cPLnqQ',
    appId: '1:544237746059:ios:23177266d6cb353bb5218e',
    messagingSenderId: '544237746059',
    projectId: 'firecars-98ddb',
    storageBucket: 'firecars-98ddb.firebasestorage.app',
    iosBundleId: 'com.example.fireCars',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDF7UndLudus1yoj4FvK1-LusiC_ROV9KU',
    appId: '1:544237746059:web:08d0da7d4df30c51b5218e',
    messagingSenderId: '544237746059',
    projectId: 'firecars-98ddb',
    authDomain: 'firecars-98ddb.firebaseapp.com',
    storageBucket: 'firecars-98ddb.firebasestorage.app',
  );
}
