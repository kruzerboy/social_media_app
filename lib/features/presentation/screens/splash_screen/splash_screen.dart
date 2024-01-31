import 'package:flutter/material.dart';
import 'dart:async';import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/features/presentation/screens/feed_screen.dart';
import 'package:social_media_app/responsive/mobile_screen_layout.dart';
import 'package:social_media_app/responsive/responsive_layout.dart';
import 'package:social_media_app/responsive/web_screen_layout.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(microseconds: 3000
    ), () {
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const  ResponsiveLayout(
                    mobileScreenLayout: MobileScreenLayout(),
                    webScreenLayout: WebScreenLayout(),
                  )),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Add your logo or image here
              SvgPicture.asset('assets/ic_instagram.svg'),
            
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:social_media_app/features/presentation/screens/feed_screen.dart';
// import 'package:social_media_app/responsive/mobile_screen_layout.dart';
// import 'package:social_media_app/responsive/responsive_layout.dart';
// import 'package:social_media_app/responsive/web_screen_layout.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   StreamController<bool> _controller = StreamController<bool>();

//   @override
//   void initState() {
//     super.initState();
//     // Add your logic here to populate the stream with data
//     _populateStream();
//   }

//   void _populateStream() async {
//     await Future.delayed(Duration(seconds: 3));
//     _controller.add(true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: StreamBuilder<bool>(
//           stream: _controller.stream,
//           builder: (context, snapshot) {
//             if (snapshot.hasData ) {
//               // Render your responsive layout when data is available
//               return const  ResponsiveLayout(
//                 mobileScreenLayout: MobileScreenLayout(),
//                 webScreenLayout: WebScreenLayout(),
//               );
//             } else {
//               // Render a loading indicator or another widget while waiting for data
//               return CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//     );
//   }
// }