import 'package:flutter/widgets.dart';
import 'package:social_media_app/features/data/models/user.dart';
import 'package:social_media_app/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  // User get getUser => _user!;
User get getUser {
  if (_user == null) {
    // Handle the null case. You might want to return a default User object or throw an exception.
    throw UnimplementedError('User is null');
  }
  return _user!;
}
  // Future<void> refreshUser() async {
  //   User user = await _authMethods.getUserDetails();
  //   _user = user;
  //   notifyListeners();  
  Future<void> refreshUser() async {
  try {
    User user = await _authMethods.getUserDetails();
    // if (user == null) {
    //   // Handle the null case. You might want to throw an exception or assign a default User object to _user.
    //   throw UnimplementedError('User details are null');
    // }
    _user = user;
    notifyListeners();
  } catch (e) {
    // Handle any errors that might occur during the asynchronous operation.
     print('Error refreshing user: $e');
  }
}
  // }
}
// Future<void> refreshUser() async {
//   try {
//     User user = await _authMethods.getUserDetails();
//     if (user == null) {
// //       // Handle the null case. You might want to throw an exception or assign a default User object to _user.
//       throw UnimplementedError('User details are null');
//     }
//     _user = user;
//     notifyListeners();
//   } catch (e) {
// //     // Handle any errors that might occur during the asynchronous operation.
//     print('Error refreshing user: $e');
//   }
// }
// class UserProvider with ChangeNotifier {
//   User? _user;
//   final AuthMethods _authMethods = AuthMethods();

//   get getUser =>  _user?? "user";
  
//   bool get isLoggedIn => _user!= null;

//   Future<void> refreshUser() async {
//     User user = await _authMethods.getUserDetails();
//     _user = user;
//     notifyListeners();
//   }
// }                         
