import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/themes/themes_view/themes_view_model.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.keyboard_backspace),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0.0,
        title:const  Text(
          "Settings",
          style: TextStyle(),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding:const  EdgeInsets.all(10.0),
        child: ListView(
          children: const <Widget>[
         ListTile(
                title: Text(
                  "About",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    
                  ),
                ),
                subtitle: Text(
                  "Social media app get connected and updated to your fav on",
                ),
                trailing:  Icon(Icons.error)),
            Divider(),
       ListTile(
              title: Text(
                "Dark Mode",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text("Use the dark mode"),
              // trailing: Consumer<ThemeProvider>(
              //   builder: (context, notifier, child) => CupertinoSwitch(
              //     onChanged: (val) {
              //       notifier.toggleTheme();
                  // },
                  // value: notifier.dark,
                  // activeColor: Theme.of(context).colorScheme.secondary,
                ),
              // ),
            // ),
          ],
        ),
      ),
    );
  }
}
