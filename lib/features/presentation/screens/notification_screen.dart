import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/colors.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //

        backgroundColor: mobileBackgroundColor,

        centerTitle: false,
        //
        title: const Text(
          'Notifications',
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('notifications')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong',
                style: TextStyle(color: Colors.red)); // Set error text color
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(data['userImage']),
                ),
                title: Text(
                  '${data['username']} ${data['type'] == 'like' ? 'liked your post' : 'started following you'}',
                  style: TextStyle(color: Colors.black), // Set title text color
                ),
                subtitle: Text(
                  (data['timestamp'] as Timestamp).toDate().toString(),
                  style:
                      TextStyle(color: Colors.grey), // Set subtitle text color
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
