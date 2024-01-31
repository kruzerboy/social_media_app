
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/features/presentation/screens/profile/followers_profile.dart';
import 'package:social_media_app/resources/auth_methods.dart';
import 'package:social_media_app/resources/firestore_methods.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/features/presentation/screens/profile/edit_profile_screen.dart';
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
 final TextEditingController _nameController = TextEditingController();
 final  TextEditingController _usernameController = TextEditingController();
 final TextEditingController _bioController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar( 
        // foregroundColor: Colors.black,
       backgroundColor: Colors.black,
        // elevation: 0,
        centerTitle: false, 
        title:const  Text("Edit profile",),
    actions:  [ 
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(context);
        },
        child: const Text('cancel'),
      ),
    ],
      ),
      
        body:
       
       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
        
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(
                             'https://th.bing.com/th/id/OIP.5aXBZ-xDeywzQoWFaMxTLQHaJG?w=208&h=256&c=7&r=0&o=5&dpr=1.3&pid=1.7'
                            ),
                            radius: 30,
                          ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextFormField(
              controller: _bioController,
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
        
          ],
        ),
      ),
      
    );
    
  }
}
    
  
// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:social_media_app/resources/auth_methods.dart';
// import 'package:social_media_app/utils/colors.dart';
// import 'package:social_media_app/utils/global_variable.dart';
// import 'package:social_media_app/utils/utils.dart';
// import 'package:social_media_app/widgets/text_field_input.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({Key? key}) : super(key: key);

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final TextEditingController _bioController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   Uint8List? _image;
//   bool _isLoading = false;
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _bioController.dispose();
//     _usernameController.dispose();
//   }

//   void signUpUser() async {
//     setState(() {
//       _isLoading = true;
//     });

//     String res = await AuthMethods().signUpUser(
//         email: _emailController.text,
//         password: _passwordController.text,
//         username: _usernameController.text,
//         bio: _bioController.text,
//         file: _image!);
//     // print(res);
//       setState(() {
//       _isLoading = false;
//     });
//     if (res != "success") {
//       showSnackBar(res, context);
//     }
//   }

//   void selectImage() async {
//     Uint8List im = await pickImage(ImageSource.gallery);
//     setState(() {
//       _image = im;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
    
     
//       body: Container(
//         padding
//             : MediaQuery.of(context).size.width > webScreenSize
//                 ? EdgeInsets.symmetric(
//                     horizontal: MediaQuery.of(context).size.width / 3)
//             : const EdgeInsets.symmetric(horizontal: 32),
//         width: double.infinity,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Flexible(
//               flex: 2,
//               child: Container(),
//             ),
//             SvgPicture.asset(
//               'assets/ic_instagram.svg',
//               color: primaryColor,
//               height: 64,
//             ),
//             const SizedBox(
//               height: 64,
//             ),
//             Stack(
//               children: [
//                 _image != null
//                     ? CircleAvatar(
//                         radius: 64,
//                         backgroundImage: MemoryImage(_image!),
//                       )
//                     : const CircleAvatar(
//                         radius: 64,
//                         backgroundImage: NetworkImage(
//                             'https://tse3.mm.bing.net/th?id=OIP.TmFdrhMS6gzhI-ACF3977wHaF2&pid=Api&P=0&h=180'),
//                       ),
//                 Positioned(
//                   bottom: -10,
//                   left: 80,
//                   child: IconButton(
//                     onPressed: selectImage,
//                     icon: const Icon(Icons.add_a_photo),
//                   ),
//                 )
//               ],
//             ),
//          const    Padding(padding: EdgeInsets.all(8)),
          
//             // text field to take username

//             TextFieldInput(
//               hintText: 'Enter your name',
//               textInputType: TextInputType.text,
//               textEditingController: _usernameController,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             //text field to take bio

//             TextFieldInput(
//               hintText: 'Enter your bio',
//               textInputType: TextInputType.text,
//               textEditingController: _bioController,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             //text field to take email
//             TextFieldInput(
//               hintText: 'Enter your email',
//               textInputType: TextInputType.emailAddress,
//               textEditingController: _emailController,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             //text field to take password
//             TextFieldInput(
//               hintText: 'Enter your password',
//               textInputType: TextInputType.text,
//               textEditingController: _passwordController,
//               isPass: true,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             ElevatedButton(
//               onPressed:
//                   // SignUpUser ,
//                   signUpUser,
                  
//               child: Container(
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 decoration: const ShapeDecoration(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(4)),
//                   ),
//                   color: blueColor,
//                 ),
//                 child: !_isLoading
//                     ? const Text(
//                         'Save',
//                       )
//                     : const CircularProgressIndicator(
//                         color: primaryColor,
//                       ),
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Flexible(
//               flex: 2,
//               child: Container(),
//             ),
           
//           ],
//         ),
//       ),
//     );
//   }
// }

