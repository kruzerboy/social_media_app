
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
                  ? const Center(
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
                                margin: const EdgeInsets.symmetric(vertical: 10),
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
                               const  SizedBox(width: 10),
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

