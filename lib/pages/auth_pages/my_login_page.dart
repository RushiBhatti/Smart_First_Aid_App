import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstaidapp/pages/auth_pages/my_register_page.dart';
import 'package:firstaidapp/pages/main_pages/splash_screen.dart';
import 'package:firstaidapp/utils/flutterToastMsg.dart';
import 'package:firstaidapp/utils/login_textfields.dart';
import 'package:flutter/material.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // login function
  void onLoginPress() async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text.toString(), password: _passwordController.text.toString())
        .then((value){
      setState(() {
        loading = false;
      });

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const SplashScreen() ;
      }));

    }).onError((error, stackTrace){
      setState(() {
        loading = false;
      });
      FlutterToastMsg.toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // App name heading...
                const Text(
                  "Smart First Aid",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                    color: Colors.deepPurple,
                    letterSpacing: 2,
                  ),
                ),
                const Divider(
                  endIndent: 50,
                  thickness: 2,
                ),

                Center(
                  child: Image.asset(
                    "assets/images/Login Vector Img.jpeg",
                    height: 300,
                  ),
                ),

                const Text(
                  "Login!",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      color: Colors.deepPurple,
                      letterSpacing: 2),
                ),

                Text(
                  "Please Sign in to continue.",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Colors.deepPurple.shade200,
                      letterSpacing: 1),
                ),

                const SizedBox(
                  height: 30,
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),

                        // email text field
                        child: MyLoginTextField(
                          icon: Icons.account_circle,
                          hintText: "Enter email...",
                          obscureText: false,
                          textEditingController: _emailController,
                        ),
                      ),

                      // password text field
                      MyLoginTextField(
                        icon: Icons.lock_outline_rounded,
                        hintText: "Enter password...",
                        obscureText: true,
                        textEditingController: _passwordController,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 25,
                ),

                // login button
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      onLoginPress();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: loading ? const CircularProgressIndicator(color: Colors.white,strokeWidth: 1,) : const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 12, letterSpacing: 1),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyRegisterPage();
                        }));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Colors.blue.shade700,
                            letterSpacing: 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
