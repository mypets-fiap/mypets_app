import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyDtUbopEu2QmnC8ecEg6oOwiFxhIU17E64',
    appId: '1:180854016374:web:31af9912ea9d8b5b6e1257',
    messagingSenderId: '180854016374',
    projectId: 'mypets-fiap',
    authDomain: 'mypets-fiap.firebaseapp.com',
    storageBucket: 'mypets-fiap.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDjBy96FRanFFI4P2yeKowmJM22z3azsgw',
    appId: '1:180854016374:android:de3c6701a868e9ce6e1257',
    messagingSenderId: '180854016374',
    projectId: 'mypets-fiap',
    storageBucket: 'mypets-fiap.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDF24RZGaqxnGeqKFCWl01-wjENeyZexpk',
    appId: '1:180854016374:ios:07649a6058e774b26e1257',
    messagingSenderId: '180854016374',
    projectId: 'mypets-fiap',
    storageBucket: 'mypets-fiap.appspot.com',
    iosClientId: '180854016374-07uapda2sbl930pnjfflfct9hfvv3bpq.apps.googleusercontent.com',
    iosBundleId: 'br.com.fiap.mypets.mypets',
  );
}
