import'package:flutter/material.dart';
import 'package:social_media_app/utils/colors.dart';
import 'package:social_media_app/widgets/text_field_input.dart';
class EditProfileScreen
 extends StatefulWidget {
  const EditProfileScreen
  ({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfileScreen> {
   TextEditingController _nameController = TextEditingController();
   TextEditingController _usernameController = TextEditingController();
   TextEditingController _bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar(
        // foregroundColor: Colors.black,
       backgroundColor: Colors.transparent,
        // elevation: 0,
        centerTitle: false, 
        title: const Center(child: Text("Edit profile",),
        ),
        actions: [
        
        ],
      ),
       body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _bioController,
              decoration: InputDecoration(labelText: 'Bio'),
            ),
              ElevatedButton(
              onPressed: () {
               onPressed: () {
    
    String newName = _nameController.text;
    String newBio = _bioController.text;
    // Call a function to update the user's profile data
  };


              },
              child:const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
    
  
