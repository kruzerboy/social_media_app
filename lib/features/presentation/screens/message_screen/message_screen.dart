import 'package:flutter/material.dart';
import 'package:social_media_app/features/presentation/screens/message_screen/models/chatUserModel.dart';
import 'package:social_media_app/features/presentation/screens/message_screen/widgets/conversationList.dart';

class Messagescreen extends StatefulWidget {
  const Messagescreen({super.key});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  
    List<ChatUsers> chatUsers = [
    ChatUsers(text: "Jane Russel", secondaryText: "Awesome Setup", image: "images/userImage1.jpeg", time: "Now", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Glady's Murphy", secondaryText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Jorge Henry", secondaryText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Philip Fox", secondaryText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Debra Hawkins", secondaryText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Jacob Pena", secondaryText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "Andrey Jones", secondaryText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb", name: '', messageText: '', imageURL: ''),
    ChatUsers(text: "John Wick", secondaryText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb", name: '', messageText: '', imageURL: ''),
  ];
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Container(
                      padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.pink[50],
                      ),
                      child: const Row(
                        children: <Widget>[
                          Icon(Icons.add,color: Colors.pink,size: 20,),
                          SizedBox(width: 2,),
                          Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade100
          )
      ),
    ),
  ),
),
    ListView.builder(
  itemCount: chatUsers.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 16),
  physics: NeverScrollableScrollPhysics(),
  itemBuilder: (context, index){
    return ConversationList(
      name: chatUsers[index].name,
      messageText: chatUsers[index].messageText,
      imageUrl: chatUsers[index].imageURL,
      time: chatUsers[index].time,
      isMessageRead: (index == 0 || index == 3)?true:false,
    );
  },
)   ],
          
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:social_media_app/features/presentation/screens/message_screen/message_model.dart';
// import 'package:social_media_app/features/presentation/screens/message_screen/message_provider/message_provider.dart';



// class MessageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Consumer<MessageProvider>(
//               builder: (context, messageProvider, _) {
//                 return ListView.builder(
//                   itemCount: messageProvider.messages.length,
//                   itemBuilder: (context, index) {
//                     Message message = messageProvider.messages[index];
//                     return ListTile(
//                       title: Text(message.text),
//                       subtitle: Text(message.sender),
//                       // Add more UI elements as needed
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           _buildMessageInputField(context),
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInputField(BuildContext context) {
//     String newMessage = '';

//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               onChanged: (value) {
//                 newMessage = value;
//               },
//               decoration: InputDecoration(labelText: 'Type a message...'),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               if (newMessage.isNotEmpty) {
//                 String currentUser = Provider.of<FirebaseService>(context, listen: false).getCurrentUser();
//                 Provider.of<MessageProvider>(context, listen: false).addMessage(Message(text: newMessage, sender: currentUser, timestamp: null));
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:social_media_app/features/presentation/screens/message_screen/message_model.dart';
// import 'package:social_media_app/features/presentation/screens/message_screen/message_provider/message_provider.dart';
// // Replace with the actual path to FirebaseService

// class MessageScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: Consumer<MessageProvider>(
//               builder: (context, messageProvider, _) {
//                 return ListView.builder(
//                   itemCount: messageProvider.messages.length,
//                   itemBuilder: (context, index) {
//                     Message message = messageProvider.messages[index];
//                     return ListTile(
//                       title: Text(message.text),
//                       subtitle: Text(message.sender),
//                       // Add more UI elements as needed
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//           _buildMessageInputField(context, ()), // Pass an instance of FirebaseService
//         ],
//       ),
//     );
//   }

//   Widget _buildMessageInputField(BuildContext context,  firebaseService) {
//     String newMessage = '';

//     return Container(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         children: <Widget>[
//           Expanded(
//             child: TextField(
//               onChanged: (value) {
//                 newMessage = value;
//               },
//               decoration: InputDecoration(labelText: 'Type a message...'),
//             ),
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: () {
//               if (newMessage.isNotEmpty) {
//                 String currentUser = firebaseService.getCurrentUser(); // Use the provided instance
//                 Provider.of<MessageProvider>(context, listen: false).addMessage(Message(text: newMessage, sender: currentUser,));
//               }
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }