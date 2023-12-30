import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/features/presentation/screens/signup_screen.dart';
import 'package:social_media_app/utils/colors.dart';
import 'package:social_media_app/resources/auth_methods.dart';
import 'package:social_media_app/responsive/mobile_screen_layout.dart';
import 'package:social_media_app/responsive/responsive_layout.dart';
import 'package:social_media_app/responsive/web_screen_layout.dart';

import 'package:social_media_app/utils/global_variable.dart';
import 'package:social_media_app/utils/utils.dart';
import 'package:social_media_app/widgets/text_field_input.dart';

// import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      // if 
      // (context.mounted) {
      //   (Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => const HomeScreen())));
      // }
    
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ResponsiveLayout(
                  mobileScreenLayout: MobileScreenLayout(),
                  webScreenLayout: WebScreenLayout(),
                ),
              ),
              (route) => false);
        }
        setState(() {
          _isLoading = false;
        });
    }

    // }
    else {
      setState(() {
        _isLoading = false;
      });
      if (context.mounted) {
        showSnackBar(res, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding
              : MediaQuery.of(context).size.width > webScreenSize
                  ? EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                child: Container(),
              ),
              SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 64,
              ),
              const SizedBox(
                height: 64,
              ),
              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 24,
              ),
              //logibn button
              ElevatedButton(
                onPressed: loginUser,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                  child: !_isLoading
                      ? const Text(
                          'Log in',
                        )
                      : const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                flex: 2,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: const Text(
                     " Don't have an account?",
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        ' SignUp.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:social_media_app/utils/colors.dart';
// import 'package:social_media_app/widgets/text_field_input.dart';
// import 'package:social_media_app/themes/light_theme.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 32,
//             ),
//             child: Column(
//               //to do: svg image
//               //text field email
//               //text field for password
//               //login button
//               //sign up suggestion through smaller text

//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // Logo widget her
//                 const Padding(padding: EdgeInsets.all(100)),
//                 SvgPicture.asset(
//                   'assets/ic_instagram.svg',
//                   colorFilter: const ColorFilter.mode(primaryColor, BlendMode.srcIn),
//                   height: 60,
//                 ),

//                 const Padding(padding: EdgeInsets.all(30)),
//                 //sign up method

//                 TextFieldInput(
//                     textEditingController: _emailController,
//                     hintText: "Enter your email",
//                     textInputType: TextInputType.emailAddress),
//                 const Padding(padding: EdgeInsets.all(8)),
//                 TextFieldInput(
//                   textEditingController: _passwordController,
//                   hintText: "Enter your password",
//                   textInputType: TextInputType.emailAddress,
//                   isPass: true,
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 //

//                 // Sign in button here
//                 ElevatedButton(
//                   onPressed: (){},
//                   child: Container(

//                     width: double.infinity,
//                     alignment: Alignment.center,
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     decoration: const ShapeDecoration(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(2)),
//                       ),
//                       color: blueColor,
//                     ),
//                     child: const Text("Sign In "),

//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 Flexible(
//                   flex: 1,
//                   child: Container(),
//                 ),
//                 //transitioning for signup

//                 const Row(
//                   children: [
//                     Text(
//                       "don't have account?",
//                       style: TextStyle(
//                           color: Colors.white54,
//                           fontWeight: FontWeight.bold,
//                           fontStyle: FontStyle.normal),
//                     ),
//                     InkWell(
//                       child: Text(
//                         "sign up",
//                         style: TextStyle(
//                             color: Colors.white54,
//                             fontWeight: FontWeight.bold,
//                             fontStyle: FontStyle.normal),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // )
//                 // ElevatedButton(

//                 //   onPressed: () {
//                 //     // VoidCallback? onLongPress;
//                 //     // Add sign in button functionality
//                 //   },
//                 //   child: const Text('Sign In'),
//                 //    // Sign up prompt text here
//                 // ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
