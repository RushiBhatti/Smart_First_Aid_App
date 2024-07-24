import 'package:firstaidapp/pages/auth_pages/my_login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/pages/main_pages/my_blog_page.dart';
import 'package:firstaidapp/pages/main_pages/my_chat_page.dart';
import 'package:firstaidapp/pages/main_pages/my_home_page.dart';
import 'package:firstaidapp/pages/main_pages/my_quick_sheet_page.dart';
import 'package:firstaidapp/pages/main_pages/my_more_page.dart';
import 'package:firstaidapp/pages/main_pages/splash_screen.dart';
import 'package:firstaidapp/utils/mydrawer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // firebase_options.dart file must be present for doing above task!

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Globals.appName,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),

      routes: {
        Globals.homePageRoute : (context) => const MyHomePage(),
        Globals.quickSheetPageRoute : (context) => MyQuickSheetPage(),
        Globals.chatPageRoute : (context) => const MyChatPage(),
        Globals.blogPageRoute : (context) => const MyBlogPage(),
        Globals.morePageRoute : (context) => const MyMorePage(),
      },

      home: (FirebaseAuth.instance.currentUser != null) ? const SplashScreen() : const MyLoginPage() ,
      // home: MyAddBlogPage() ,
    );
  }
}

class MyIntroPage extends StatefulWidget {
  const MyIntroPage({super.key});

  @override
  State<MyIntroPage> createState() => _MyIntroPageState();
}

class _MyIntroPageState extends State<MyIntroPage> {
  var _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const MyHomePage(),
    const MyChatPage(),
    const MyBlogPage(),
    MyQuickSheetPage(),
    const MyMorePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawerWidget(),

      appBar: AppBar(
        title: const Text(Globals.appName),
        backgroundColor: Colors.blue[200],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,

        onTap: _navigateBottomBar,

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[50],
        // fixedColor: Colors.blue,
        selectedItemColor: Colors.indigo[900],
        unselectedItemColor: Colors.blue[300],

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity_sharp), label: "ChatBot"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_rounded), label: "Blog Section"),
          BottomNavigationBarItem(
              icon: Icon(Icons.info_outline_rounded),
              label: "Quick Sheet"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle_outline_rounded), label: "More"),
        ],
      ),

      body: _pages[_selectedIndex],
    );
  }
}
