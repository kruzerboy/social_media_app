import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/colors.dart';

class Activities extends StatefulWidget {
  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
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
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:social_media_app/components/notification_stream_wrapper.dart';
// import 'package:social_media_app/features/presentation/screens/notification_screen/models/notification.dart';
// import 'package:social_media_app/resources/auth_methods.dart';
// class Activities extends StatefulWidget {
//   @override
//   _ActivitiesState createState() => _ActivitiesState();
// }

// class _ActivitiesState extends State<Activities> {
//   currentUserId() {
//     return AuthMethods.User!.uid;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Text('Notifications'),
//         centerTitle: true,
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: GestureDetector(
//               onTap: () => deleteAllItems(),
//               child: Text(
//                 'CLEAR',
//                 style: TextStyle(
//                   fontSize: 13.0,
//                   fontWeight: FontWeight.w900,
//                   color: Theme.of(context).colorScheme.secondary,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: ListView(
//         children: [
//           getActivities(),
//         ],
//       ),
//     );
//   }

//   getActivities() {
//     return ActivityStreamWrapper(
//       shrinkWrap: true,
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       stream: notificationRef
//           .doc(currentUserId())
//           .collection('notifications')
//           .orderBy('timestamp', descending: true)
//           .limit(20)
//           .snapshots(),
//       physics: NeverScrollableScrollPhysics(),
//       itemBuilder: (_, DocumentSnapshot snapshot) {
//         ActivityModel activities =
//             ActivityModel.fromJson(snapshot.data() as Map<String, dynamic>);
//         return ActivityItems(
//           activity: activities,
//         );
//       },
//     );
//   }

//   deleteAllItems() async {
// //delete all notifications associated with the authenticated user
//     QuerySnapshot notificationsSnap = await notificationRef
//         .doc(AuthMethods.currentUser!.uid)
//         .collection('notifications')
//         .get();
//     notificationsSnap.docs.forEach(
//       (doc) {
//         if (doc.exists) {
//           doc.reference.delete();
//         }
//       },
//     );
//   }
// }
