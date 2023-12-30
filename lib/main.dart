import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/features/presentation/screens/onboarding_screen/onboarding_screen.dart';
import 'package:social_media_app/providers/user_provider.dart';
import 'package:social_media_app/responsive/responsive_layout.dart';
import 'package:social_media_app/responsive/mobile_screen_layout.dart';
import 'package:social_media_app/responsive/web_screen_layout.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:social_media_app/features/presentation/screens/home_screen.dart';
import 'package:social_media_app/features/presentation/screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyC_AQVf5USyAkT53yr4RJWCEoQNsF_lbiI',
        appId: '1:666597181130:web:96f3d2d8e2bc7239b11633',
        messagingSenderId: '666597181130',
        projectId: 'social-media-app-53ab2',
        storageBucket: 'social-media-app-53ab2.appspot.com',
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)  => UserProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         title: 'social media app',
        theme: ThemeData.light(), // Set the default light theme
        darkTheme: ThemeData.dark(), // Set the dark theme
        themeMode: ThemeMode.system, // Use system theme mode (dark or light based on device settings)
        home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Checking if the snapshot has any data or not
                if (snapshot.hasData) {
                  // if snapshot has data which means user is logged in
                  // then we check the width of screen 
                  //and accordingly display the screen layout
                  return 
                //  const SearchScreen();
                  //  OnboardingScreen();
                  //  const HomeScreen();
                  
                  const ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }
                  // means connection to future hasn' t been made yet
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return const LoginScreen();
            }),
      ),
    );
  }
}
