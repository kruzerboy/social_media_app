// import 'package:flutter/material.dart';
// import 'package:social_media_app/utils/dimesions.dart';
// class ResponsiveLayout extends StatelessWidget {
//   final Widget webScreenLayout;
//   final Widget mobileScreenLayout;
//   const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});

//   @override
//   Widget build(BuildContext context) {
//     return 
//      LayoutBuilder(
//       builder: (context, constraints) {
//         if (constraints.maxWidth >= webScreenSize) {
//            return webScreenLayout;
//         }
//         return mobileScreenLayout;
//       }
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/providers/user_provider.dart';
import 'package:social_media_app/utils/global_variable.dart';
// import 'package:provider/provider.dart';
//  import 'package:social_media_app/utils/dimesions.dart';
class ResponsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  void initState() {
    super.initState();
    addData();
  }

  addData() async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
