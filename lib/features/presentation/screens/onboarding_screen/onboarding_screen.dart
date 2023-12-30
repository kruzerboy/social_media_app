// import 'package:flutter/material.dart';

// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   int _currentPage = 0;
//   final PageController _pageController = PageController(initialPage: 0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _pageController,
//         onPageChanged: (int page) {
        //   setState(() {
        //     _currentPage = page;
        //   });
        // },
//         children: <Widget>[
//           _buildPageContent(
//             title: 'Welcome to Social Media App',
          
//             body: 'connect with your friends.',
            
//             image: 'assets/images/onboarding1.jpg',
//           ),
//           _buildPageContent(
//             title: 'Share Your Memories',
//             body: 'Share your thoughts with your friends',
//             image: 'assets/images/onboarding1.jpg',
//           ),
//           _buildPageContent(
//             title: 'Find Your Interests',
//             body: 'Explore the content tailored for you',
//             image: 'assets/images/onboarding2.jpg',
//           ),
//         ],
//       ),
//       bottomSheet: _currentPage != 2
//           ? Container(
//               margin: const EdgeInsets.only(bottom: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   TextButton(
//                     onPressed: () {
//                       _pageController.animateToPage(2,
//                           duration:const Duration(milliseconds: 400),
//                           curve: Curves.easeIn);
//                     },
//                     child: const Text(
//                       'Skip',
//                       style: TextStyle(color: Colors.red, fontSize: 20),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           : InkWell(
//               onTap: () => print('Get Started Now'),
//               child: Container(
//                 height: 60,
//                 color: Colors.blue,
//                 alignment: Alignment.center,
//                 child: const Text(
//                   'Get Started Now',
//                   style:  TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildPageContent({required String title, required String body, required String image}) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Expanded(child: Image.asset('assets/images/onboarding2.jpg')),
//           Text(
//             title,
//             style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(height: 35),
//           Text(
//             body,
//             style: const TextStyle(fontSize: 18),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';



class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        appBar: AppBar(
       
        ),
        body: PageView(
children: [
  Column(
    children: [

    Image.asset('assets/images/onboarding1.jpg',width: 500,)

    ],
  )
],
        )
        
    
    );
  }
}