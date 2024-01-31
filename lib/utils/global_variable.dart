import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/features/presentation/screens/post/add_post_screen.dart';
import 'package:social_media_app/features/presentation/screens/feed_screen.dart';
import 'package:social_media_app/features/presentation/screens/notification_screen/pages/activities.dart';
// import 'package:social_media_app/features/presentation/screens/notification_screen.dart';
import 'package:social_media_app/features/presentation/screens/profile/profile_screen.dart';
import 'package:social_media_app/features/presentation/screens/search_screen.dart';

// import '../features/presentation/reels_screen/reels_screen.dart';


const webScreenSize = 600;

List<Widget> homeScreenItems = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  // const ReelsScreen(),
  // 
  Activities(),
  ProfileScreen(
    uid: FirebaseAuth.instance.currentUser!.uid,
  ),
];
