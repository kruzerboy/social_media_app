// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:social_media_app/features/presentation/screens/profile/profile_screen.dart';
//
// import 'package:social_media_app/utils/colors.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController searchController = TextEditingController();
//   bool isShowUsers = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: mobileBackgroundColor,
//         title: Form(
//           child: TextFormField(
//             controller: searchController,
//             decoration:
//                 const InputDecoration(labelText: 'Search for a user...'),
//             onFieldSubmitted: (String _) {
//               setState(() {
//                 isShowUsers = true;
//               });
//             },
//           ),
//         ),
//       ),
//       body: isShowUsers
//           ? FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection('users')
//                   .where(
//                     'username',
//                     isGreaterThanOrEqualTo: searchController.text,
//                   )
//                   .get(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//                 return ListView.builder(
//                   itemCount: (snapshot.data! as dynamic).docs.length,
//                   itemBuilder: (context, index) {
//                     return InkWell(
//                       onTap: () => Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) => ProfileScreen(
//                             uid: (snapshot.data! as dynamic).docs[index]['uid'],
//                           ),
//                         ),
//                       ),
//                       child: ListTile(
//                         leading: CircleAvatar(
//                           backgroundImage: NetworkImage(
//                             (snapshot.data! as dynamic).docs[index]['photoUrl'],
//                           ),
//                           radius: 16,
//                         ),
//                         title: Text(
//                           (snapshot.data! as dynamic).docs[index]['username'],
//                         ),
//                       ),
//                     );
//                   },
//                 );
//               },
//             )
//           : FutureBuilder(
//               future: FirebaseFirestore.instance
//                   .collection('posts')
//                   .orderBy('datePublished')
//                   .get(),
//               builder: (context, snapshot) {
//                 if (!snapshot.hasData) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 return MasonryGridView.count(
//                   crossAxisCount: 3,
//                   itemCount: (snapshot.data! as dynamic).docs.length,
//                   itemBuilder: (context, index) => Image.network(
//                     (snapshot.data! as dynamic).docs[index]['postUrl'],
//                     fit: BoxFit.cover,
//                   ),
//                   mainAxisSpacing: 8.0,
//                   crossAxisSpacing: 8.0,
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:social_media_app/features/presentation/screens/profile/profile_screen.dart';

import 'package:social_media_app/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  bool isShowUsers = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: searchController,
                    style: const  TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                    hintText: 'Search',
                     hintStyle: TextStyle(color: Colors.grey),
                  ),
                  onFieldSubmitted: (String _) {
                    setState(() {
                      isShowUsers = true;
                    });
                  },
                ),
              ),
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    isShowUsers = true;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: isShowUsers
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('users')
                  .where(
                    'username',
                    isGreaterThanOrEqualTo: searchController.text,
                  )
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data != null ? (snapshot.data as dynamic).docs.length : 0,
                  itemBuilder: (context, index) {
                     if (snapshot.data != null) {
                     var doc = (snapshot.data! as dynamic).docs[index];
                     if (doc['uid'] != null && doc['photoUrl'] != null && doc['username'] != null){
                    return InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            uid: (snapshot.data! as dynamic).docs[index]['uid'],
                          ),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            (snapshot.data! as dynamic).docs[index]['photoUrl'],
                          ),
                          radius: 16,
                        ),
                        title: Text(
                          (snapshot.data! as dynamic).docs[index]['username'],
                        ),
                      ),
                    );
                     } else {
      return  Container(); // return an empty container if fields do not exist
    }  } else {
      return Container(); // return an empty container if snapshot.data is null
    }
                  },
                );
                
              },
              
            )
          : FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('posts')
                  .orderBy('datePublished')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MasonryGridView.count(
                  crossAxisCount: 3,
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) => Image.network(
                    (snapshot.data! as dynamic).docs[index]['postUrl'],
                    fit: BoxFit.cover,
                  ),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                );
              },
            ),
    );
  }
}
