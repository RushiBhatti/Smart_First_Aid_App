import 'package:firstaidapp/utils/mydrawer.dart';
import 'package:flutter/material.dart';

class MySettingsPage extends StatelessWidget{
  const MySettingsPage({super.key});
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
        title: const Text("Settings"),
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
                  "\nABOUT API KEY",
                  style: _getTextStyle(
                      fontSize: 20,
                      fontColor: Colors.black,
                      letterSpacing: 2,
                      isUnderLined: true
                  ),
                ),
                Text(
                  "\nAPI KEY IS VERY CONFIDENTIAL THING."
                      "\n\n -> ''CHARGES NEEDS TO BE PAID IF THE KEY USAGE EXCEEDS ITS LIMIT.''"
                      "\n\nTHUS, USE IT VERY CAREFULLY."
                      "\n\nUSAGE IS DIRECTLY RELATED WITH : THE MESSAGES YOU SENT IN ''chat page'' "
                      "OR THE SYMPTOMS YOU ENTER IN ''home page''.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.redAccent.shade700,
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