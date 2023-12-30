// import 'package:flutter/material.dart';

// class FollowersProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//  var followers = []; // Initialize followers as an empty list
//     return Scaffold(
//       appBar: AppBar(
//         title:const Text('Followers Profile'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//          const Padding(
//             padding: EdgeInsets.all(8.0),
//             child: Text(
//               'Followers',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           // Slider(
//           //   value: 0.5,
//           //   onChanged: (double value) {
//           //     // Update slider value
//           //   },
//           // ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: followers.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: NetworkImage(followers[index].imageUrl),
//                   ),
//                   title: Text(followers[index].name),
//                   trailing: ElevatedButton(
//                     onPressed: () {
//                       // Follow/unfollow logic
//                     },
//                     child: Text(
//                       followers[index].isFollowing ? 'Unfollow' : 'Follow',
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//**sourced 1/
// import 'package:flutter/material.dart';

// class FollowersProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var followers = []; // Initialize followers as an empty list
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Followers Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
//         child: Column(
//           children: [
//             Expanded(
//               child: followers.isEmpty
//                   ? Center(
//                       child: Text(
//                         "No Followers",
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.w600),
//                       ),
//                     )
//                   : ListView.builder(
//                       itemCount: followers.length,
//                       itemBuilder: (context, index) {
//                         return GestureDetector(
//                           onTap: () {
//                             // Navigate to follower's profile
//                           },
//                           child: Row(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.symmetric(vertical: 10),
//                                 width: 40,
//                                 height: 40,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(20),
//                                   child: CircleAvatar(
//                                     backgroundImage:
//                                         NetworkImage(followers[index].imageUrl),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 10),
//                               Text(
//                                 followers[index].name,
//                                 style: TextStyle(
//                                     fontSize: 15, fontWeight: FontWeight.w600),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/features/data/models/user.dart';

class FollowersProfileScreen extends StatefulWidget {
  @override
  _FollowersProfileScreenState createState() => _FollowersProfileScreenState();
}

class _FollowersProfileScreenState extends State<FollowersProfileScreen> {
  List<User> followers = [];

  @override
  void initState() {
    super.initState();
    fetchFollowers().then((fetchedFollowers) {
      setState(() {
        followers = fetchedFollowers;
      });
    });
  }

  Future<List<User>> fetchFollowers() async {
    // Fetch followers from Firebase and map them to User model
    // Replace 'uid' with the actual user id
    var followersSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc('uid')
        .collection('followers')
        .get();

    return followersSnap.docs.map((doc) => User.fromSnap(doc)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: followers.isEmpty
                  ? Center(
                      child: Text(
                        "No Followers",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    )
                  : ListView.builder(
                      itemCount: followers.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigate to follower's profile
                          },
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                width: 40,
                                height: 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(followers[index].photoUrl),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                followers[index].username,
                                style:const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
//**sources2 */
// import 'package:flutter/material.dart';
// import 'package:instagram_clone_app/consts.dart';
// import 'package:instagram_clone_app/features/domain/entities/user/user_entity.dart';
// import 'package:instagram_clone_app/features/domain/usecases/firebase_usecases/user/get_single_user_usecase.dart';
// import 'package:instagram_clone_app/profile_widget.dart';
// import 'package:instagram_clone_app/injection_container.dart' as di;

// class FollowingPage extends StatelessWidget {
//   final UserEntity user;
//   const FollowingPage({Key? key, required this.user}) : super(key: key);

//   @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: backGroundColor,
  //     appBar: AppBar(
  //       title: Text("Following"),
  //       backgroundColor: backGroundColor,
  //     ),
  //     body: Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
  //       child: Column(
  //         children: [
  //           Expanded(
  //             child: user.following!.isEmpty? _noFollowersWidget() :  ListView.builder(itemCount: user.following!.length,itemBuilder: (context, index) {
  //               return StreamBuilder<List<UserEntity>>(
  //                 stream: di.sl<GetSingleUserUseCase>().call(user.following![index]),
  //                 builder: (context, snapshot) {
  //                   if (snapshot.hasData == false) {
  //                     return CircularProgressIndicator();
  //                   }
  //                   if (snapshot.data!.isEmpty) {
  //                     return Container();
  //                   }
  //                   final singleUserData = snapshot.data!.first;
  //                   return GestureDetector(
  //                     onTap: () {
  //                       Navigator.pushNamed(context, PageConst.singleUserProfilePage, arguments: singleUserData.uid);

  //                     },
  //                     child: Row(
  //                       children: [
  //                         Container(
  //                           margin: EdgeInsets.symmetric(vertical: 10),
  //                           width: 40,
  //                           height: 40,
  //                           child: ClipRRect(
  //                             borderRadius: BorderRadius.circular(20),
  //                             child: profileWidget(imageUrl: singleUserData.profileUrl),
  //                           ),
  //                         ),
  //                         sizeHor(10),
  //                         Text("${singleUserData.username}", style: TextStyle(color: primaryColor, fontSize: 15, fontWeight: FontWeight.w600),)
  //                       ],
  //                     ),
  //                   );
  //                 }
  //               );
  //             }),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

//   _noFollowersWidget() {
//     return Center(
//       child: Text("No Following", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),),
//     );
//   }
// }
