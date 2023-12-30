// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:social_media_app/models/user.dart';
// import 'package:social_media_app/providers/user_provider.dart';
// import 'package:social_media_app/utils/colors.dart';
// import 'package:social_media_app/utils/utils.dart';
// import 'dart:typed_data';
// class AddPostScreen extends StatefulWidget {
//   const AddPostScreen({super.key});

//   @override
//   State<AddPostScreen> createState() => _AddPostScreenState();
// }

// class _AddPostScreenState extends State<AddPostScreen> {
//   Uint8List? _file;

//   _selectImage(BuildContext context) async {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return SimpleDialog(
//             title: const Text('Create a Post'),
//             children: [
//               SimpleDialogOption(
//                 padding: const EdgeInsets.all(20),
//                 child: const Text('Take a photo'),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   Uint8List file = await pickImage(
//                     ImageSource.camera,
//                   );


//                   setState(() {

  
//                     _file = file;
//                   });
//                 },
//               ),
//            SimpleDialogOption(
//                 padding: const EdgeInsets.all(20),
//                 child: const Text('choose from gallary'),
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   Uint8List file = await pickImage(
//                     ImageSource.gallery,
//                   );
//                   setState(() {
//                     _file = file;
//                   });
//                 },
//               ), ],
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final User user =Provider.of<UserProvider>(context).getUser;
//     return  _file == null 
//     ? Center(
//       child: IconButton(icon: const Icon(Icons.upload),
//        onPressed: ()=>_selectImage(context),
//        )
//     )
// : Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Post to',
//         ),
//         centerTitle: false,
//         backgroundColor: mobileBackgroundColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {},
//         ),
//         actions: [TextButton(onPressed: () {}, child: const Text('Post'))],
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 25,
//                 backgroundImage: NetworkImage(
//                     user.photoUrl),
//               ),
//               SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.5,
//                 child: const TextField(
//                   // controller: _descriptionController,
//                   decoration:  InputDecoration(
//                       hintText: "Write a caption...", border: InputBorder.none),
//                   maxLines: 8,
//                 ),
//               ),
//               SizedBox(
//                 height: 45,
//                 width: 45,
//                 child: AspectRatio(
//                   aspectRatio: 487 / 451,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         image: DecorationImage(
//                       image: NetworkImage(
//                           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBRJiLqStkYiQEPqN4l0Ol3To6AwozMS5PSLFZXD5iPGtreADQGlo5OWp_Mc_6Us2XOLg&usqp=CAU'),
//                       fit: BoxFit.fill,
//                       alignment: FractionalOffset.topCenter,
//                     )),
//                   ),
//                 ),
//               ),
//               const Divider(),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// // *sourced code*
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/providers/user_provider.dart';
import 'package:social_media_app/resources/firestore_methods.dart';
import 'package:social_media_app/utils/colors.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  AddPostScreenState createState() => AddPostScreenState();
}

class AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return
       showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Create a Post'),
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo'),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery'),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
              padding: const EdgeInsets.all(20),
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        if (context.mounted) {
          showSnackBar(
            context as String,
            'Posted!' as BuildContext,
          );
        }
        clearImage();
      } else {
        if (context.mounted) {
          showSnackBar(context as String, res as BuildContext);
        }
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context as String,
        err.toString() as BuildContext,
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? Center(
            child: IconButton(
              icon: const Icon(
                Icons.upload,
              ),
              onPressed: () => _selectImage(context),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: clearImage,
              ),
              title: const Text(
                'Post to',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: () => postImage(
                    userProvider.getUser.uid,
                    userProvider.getUser.username,
                    userProvider.getUser.photoUrl,
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator()
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://tse1.mm.bing.net/th?id=OIP.IYsUZd0KhRgvnDe4ilYYlAHaJ4&pid=Api&rs=1&c=1&qlt=95&w=92&h=123'
                        //  userProvider.getUser.photoUrl,

                      ),
                    ),
SizedBox(
  width: MediaQuery.of(context).size.width * 0.3,
  child: TextField(
    controller: _descriptionController,
    decoration: const InputDecoration(
        hintText: "Write a caption...",
        border: InputBorder.none),
    maxLines: 8,
  ),
),
                    SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(),
              ],
            ),
          );
  }
}
