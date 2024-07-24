import 'package:firstaidapp/pages/auth_pages/my_login_page.dart';
import 'package:firstaidapp/utils/flutterToastMsg.dart';
import 'package:firstaidapp/utils/login_textfields.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({super.key});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {

  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cPasswordController = TextEditingController();

  // getting FirebaseAuth instance to do further authentication
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void onRegisterPress() async{
    final String password = _passwordController.text.toString();
    final String confirmPassword = _cPasswordController.text.toString();
    final String email = _emailController.text.toString().trim();

    if(password != confirmPassword){
      FlutterToastMsg.toastMessage("Password and Confirm Password field are NOT EQUAL!");
      setState(() {
        loading = false;
      });
      return ;
    }

    // Registering User...
    await _auth.createUserWithEmailAndPassword(email: email,
        password: password)
        .then((value){
      setState(() {
        loading = false;
      });

      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return const MyLoginPage() ;
      }));
    }
    ).onError((error, stackTrace){
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
                    // decoration: TextDecoration.underline
                  ),
                ),
                const Divider(
                  endIndent: 50,
                  thickness: 2,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      "assets/images/LoginImg2.png",
                      height: 200,
                    ),
                  ],
                ),

                const Text(
                  "Register",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 34,
                      color: Colors.deepPurple,
                      letterSpacing: 2),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Please register to login.",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Colors.deepPurple.shade200,
                          letterSpacing: 1),
                    ),

                  ],
                ),

                const SizedBox(
                  height: 30,
                ),

                Form(
                  key: _formKey,
                    child: Column(
                  children: [

                    // email text field
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: MyLoginTextField(
                        icon: Icons.account_circle,
                        hintText: "Enter email...",
                        obscureText: false,
                        textEditingController: _emailController,
                      ),
                    ),

                    // password text field
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: MyLoginTextField(
                        icon: Icons.lock,
                        hintText: "Enter password...",
                        obscureText: true,
                        textEditingController: _passwordController,
                      ),
                    ),

                    // confirm password text field
                    MyLoginTextField(
                      icon: Icons.lock_outline_rounded,
                      hintText: "Confirm password...",
                      obscureText: true,
                      textEditingController: _cPasswordController,
                    ),
                  ],
                )),

                const SizedBox(
                  height: 25,
                ),

                // register button
                InkWell(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      setState(() {
                        loading = true;
                      });
                      onRegisterPress();
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade900,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: loading ? const CircularProgressIndicator(color: Colors.white,strokeWidth: 1,): const Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // sign in text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                      style: TextStyle(fontSize: 12, letterSpacing: 1),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const MyLoginPage();
                        }));
                      },
                      child: Text(
                        "Sign in",
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _cPasswordController.dispose();

    super.dispose();
  }
}
