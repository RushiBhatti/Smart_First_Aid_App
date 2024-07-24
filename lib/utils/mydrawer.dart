import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/main.dart';
import 'package:firstaidapp/pages/other_pages/my_about_page.dart';
import 'package:firstaidapp/pages/other_pages/my_feedback_page.dart';
import 'package:firstaidapp/pages/other_pages/my_settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawerWidget extends StatelessWidget{
  const MyDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.only(top: 40,bottom: 8,left: 8,right: 8),
            decoration: BoxDecoration(
              color: Colors.cyanAccent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage("assets/images/First Aid Logo.jpeg"),
                  radius: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Smart First Aid"),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Health is first priority!",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),

              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home_rounded),
            title: const Text("Home"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const MyIntroPage();
              }));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => const MySettingsPage())
              );
            },
          ),ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text("About us"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => const MyAboutPage())
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text("Feedback"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context)
                  => const MyFeedbackPage())
              );
            },
          ),

          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: const Text("Log-out",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red
            ),),
            onTap: () => Globals.logOut(context),
          ),
        ],
      ),
    );
  }
}