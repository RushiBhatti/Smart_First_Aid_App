import 'package:flutter/material.dart';
import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/pages/other_pages/my_about_page.dart';
import 'package:firstaidapp/pages/other_pages/my_feedback_page.dart';
import 'package:firstaidapp/pages/other_pages/my_settings_page.dart';

class MyMorePage extends StatelessWidget {
  const MyMorePage({super.key});

  TextStyle getTextStyle(){
    return const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        letterSpacing: 1
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: Column(

        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.0),
                child: CircleAvatar(
                  radius: 60,
                  foregroundImage: AssetImage("assets/images/First Aid Logo.jpeg"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Smart First Aid",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),

                  Row(
                    children: [
                      Icon(Icons.health_and_safety_rounded),
                      Text(
                        "Health is first priority!",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(
            height: 30,
          ),

          const Divider(height: 2,color: Colors.black,endIndent: 30,indent: 30,),

          const SizedBox(height: 20,),

          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MySettingsPage();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(Icons.settings),

                  const SizedBox(width: 10,),

                  Text("Settings",style: getTextStyle()),
                ],
              )),

          const SizedBox(height: 10,),

          TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyAboutPage();
                }));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(Icons.info),

                  const SizedBox(width: 32,),

                  Text("About",style: getTextStyle()),
                ],
              )),

          const SizedBox(height: 10,),

          TextButton(
              onPressed: () => {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const MyFeedbackPage();
                }))
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Icon(Icons.feedback_outlined),

                  const SizedBox(width: 20,),

                  Text("Feedback",style: getTextStyle()),
                ],
              )),

          const SizedBox(height: 10,),

          TextButton(
              onPressed: () => Globals.logOut(context),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.logout_outlined),

                  SizedBox(width: 20,),

                  Text("Logout",style: TextStyle(
                    color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1
                  ),),
                ],
              )),

        ],
      ),
    );

  }
}
