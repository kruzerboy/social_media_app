// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// pickImage(ImageSource source)async{

//   final ImagePicker  imagePicker =ImagePicker();
//  XFile? _file = await ImagePicker.pickImage(source: source);
//  if(_file !=null){
//   return await _file.readAsBytes();
//  return file;
//  }
//  print('no image selected') ;
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// for picking up image from gallery
pickImage(ImageSource source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: source);
  if (file != null) {
    return await file.readAsBytes();
    
  }
}

// for displaying snackbars
showSnackBar(String text,BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}
