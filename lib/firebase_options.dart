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
    apiKey: 'AIzaSyAMgrtjnCf3-KtgwaldCmsW6E6itmt8LKY',
    appId: '1:66539872686:web:b3d1cee9ae00ec26b2a83f',
    messagingSenderId: '66539872686',
    projectId: 'recipe-app-99b24',
    authDomain: 'recipe-app-99b24.firebaseapp.com',
    storageBucket: 'recipe-app-99b24.firebasestorage.app',
    measurementId: 'G-9NZQHYW6C2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD9E1AbiIkyeo_yInHicq8s_Mypgr5meBA',
    appId: '1:66539872686:android:90d9fbaf3fc6c499b2a83f',
    messagingSenderId: '66539872686',
    projectId: 'recipe-app-99b24',
    storageBucket: 'recipe-app-99b24.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSH_sa-Mu4YGyrj0wVn8XN0_4BpyCo3dI',
    appId: '1:66539872686:ios:68ac8dd10458ea83b2a83f',
    messagingSenderId: '66539872686',
    projectId: 'recipe-app-99b24',
    storageBucket: 'recipe-app-99b24.firebasestorage.app',
    iosBundleId: 'com.example.recipes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSH_sa-Mu4YGyrj0wVn8XN0_4BpyCo3dI',
    appId: '1:66539872686:ios:68ac8dd10458ea83b2a83f',
    messagingSenderId: '66539872686',
    projectId: 'recipe-app-99b24',
    storageBucket: 'recipe-app-99b24.firebasestorage.app',
    iosBundleId: 'com.example.recipes',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAMgrtjnCf3-KtgwaldCmsW6E6itmt8LKY',
    appId: '1:66539872686:web:c9fbc32d05ecbb77b2a83f',
    messagingSenderId: '66539872686',
    projectId: 'recipe-app-99b24',
    authDomain: 'recipe-app-99b24.firebaseapp.com',
    storageBucket: 'recipe-app-99b24.firebasestorage.app',
    measurementId: 'G-FQVF1H8CHR',
  );
}
