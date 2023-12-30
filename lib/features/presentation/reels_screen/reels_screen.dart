import 'package:flutter/material.dart';
import 'package:social_media_app/features/presentation/reels_screen/reel_side_action_bar.dart';
import 'package:social_media_app/utils/colors.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        
        title: const Text(
          'Reels',
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold,fontSize: 26),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.camera_enhance_outlined),
            color: Colors.white,
          )
          
        ],
      ),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              decoration:  BoxDecoration(
                border: Border.all(color: Colors.black),
                  image: const  DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1701906268146-400b6624f998?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
                ),
              )),
              child: Center(
                  child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.2),
                        Colors.
                        transparent
                      ],
                      begin: const Alignment(0, -0.1),
                      end:const Alignment(0,0.1),
                    )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment,
                        children: [
                          Flexible(
                            flex: 8,
                           child: Container(
                               height: 100,
                             color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    const   Flexible(
                        flex:2,
                        child: ReelSideActionbar(),
                      )
                    ],
                  )
                ],
              )),
            );
          }),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:social_media_app/features/presentation/reels_screen/reel_side_action_bar.dart';
// import 'package:social_media_app/utils/colors.dart';

// class ReelsScreen extends StatelessWidget {
//   const ReelsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         centerTitle: false,
//         title: const Text(
//           'Reels',
//           style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 26),
//         ),
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: const Icon(Icons.camera_enhance_outlined),
//             color: Colors.white,
//           )
//         ],
//       ),
//       body: PageView.builder(
//         scrollDirection: Axis.vertical,
//         itemCount: 10,
//         itemBuilder: (context, index) {
//           return Stack(
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: NetworkImage(
//                       'https://images.unsplash.com/photo-1701906268146-400b6624f998?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8',
//                     ),
//                   ),
//                 ),
//               ),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                        const CircleAvatar(
//                           backgroundImage: NetworkImage('https://example.com/user-profile.jpg'),
//                         ),
//                         const SizedBox(width: 8),
//                         const Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('User Name', style: TextStyle(color: Colors.white)),
//                               Text('Description of the video', style: TextStyle(color: Colors.white)),
//                             ],
//                           ),
//                         ),
//                         IconButton(
//                           icon:const Icon(Icons.favorite_border, color: Colors.white),
//                           onPressed: () {},
//                         ),
//                       IconButton(
//                           icon: const Icon(Icons.comment, color: Colors.white),
//                           onPressed: () {},
//                         ),
//                    const     Text('456', style: TextStyle(color: Colors.white)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }