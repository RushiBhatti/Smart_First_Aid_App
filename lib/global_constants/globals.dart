// All the global and constant variables which is used in this app globally, are defined here...

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstaidapp/pages/auth_pages/my_register_page.dart';
import 'package:flutter/material.dart';

class Globals {
  // CONSTANT VARIABLES
  static const String appName = "Smart First Aid App";

  static const String homePageRoute = "/home_page";
  static const String quickSheetPageRoute = "/quick_sheet_page";
  static const String chatPageRoute = "/chat_page";
  static const String blogPageRoute = "/blog_page";
  static const String morePageRoute = "/more_page";

  // Logout Function
  static void logOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    Navigator.popUntil(context, (route) => route.isFirst);

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const MyRegisterPage();
    }));
  }

  // API VARIABLES
  static const String apiKeyGemini = "YOUR_API_KEY";
}
