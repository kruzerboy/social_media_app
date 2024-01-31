import 'package:firebase_core/firebase_core.dart';

class FirebaseConfig {
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        
        apiKey: 'AIzaSyC_AQVf5USyAkT53yr4RJWCEoQNsF_lbiI',
        appId: '1:666597181130:web:96f3d2d8e2bc7239b11633',
        messagingSenderId: '666597181130',
        projectId: 'social-media-app-53ab2',
        storageBucket: 'social-media-app-53ab2.appspot.com',
      ), 
    );
  }
}