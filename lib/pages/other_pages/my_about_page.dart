import 'package:firstaidapp/utils/mydrawer.dart';
import 'package:flutter/material.dart';

class MyAboutPage extends StatelessWidget {

  const MyAboutPage({super.key});

  TextStyle _getTextStyle(
      {required double fontSize,
      required Color fontColor,
      required double letterSpacing,
      required bool isUnderLined}) {
    if (isUnderLined) {
      return TextStyle(
          fontSize: fontSize,
          color: fontColor,
          letterSpacing: letterSpacing,
          fontFamily: "josefin",
          decoration: TextDecoration.underline,
      );
    } else {
      return TextStyle(
        fontSize: fontSize,
        color: fontColor,
        letterSpacing: letterSpacing,
        fontFamily: "josefin",
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: const MyDrawerWidget(),
      appBar: AppBar(
        title: const Text("About"),
        backgroundColor: Colors.blue[200],
      ),
      backgroundColor: Colors.tealAccent,
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "\nSmart First Aid App",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    letterSpacing: 1,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Colors.black,
                  endIndent: deviceWidth * 0.16,
                  indent: deviceWidth * 0.16,
                ),

                Text(
                  "\nGOAL",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nThe Smart First Aid App helps you find fast and reliable info on first aid, including symptoms, causes, treatments, and what to do next."
                      " App gives information like causes, effects, remedies, important notes to remember and additional tips."
                      "It is good to use this app for minor symptoms, but for major symptoms it becomes necessary to see a doctor.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),

                Text(
                  "\nSTAY INFORMED",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nUser can read the articles about health on the app's blog page.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),

                Text(
                  "\nNEED A QUICK\n REFERENCE?",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nSee the quick reference of common symptoms that people can feel in day to day life and their medicines also, right in the app's quick sheet page!",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),

                Text(
                  "\nGET 24/7 HELP!",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nChat with our AI assistant to get answers to your health questions.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),

                Text(
                  "\nWE MAKE IT SIMPLE!",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nThe app is designed for a smooth and user-friendly experience.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),

                Text(
                  "\nABOUT OWNER",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nThis app was Created by RB Bhatti, who is an Engineering Student at Government Engineering College, Bhavnagar.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.blueAccent.shade700,
                      letterSpacing: 1,
                      isUnderLined: false),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
