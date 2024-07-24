import 'package:firstaidapp/utils/mydrawer.dart';
import 'package:flutter/material.dart';

class MyFeedbackPage extends StatelessWidget{
  const MyFeedbackPage({super.key});

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
        title: const Text("Feedback"),
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
                  "\nYOUR FEEDBACK IS DEFINITELY VALUABLE."
                      "\n\nBut,this app is developed for project purpose and creators "
                      "not have any plan about publishing this app, so in such case feedback is not as "
                      "important through app, but you can give your feedback by meeting creators personally "
                      "and they will value your feedback definitely."
                      "\n\nTHANK YOU.",
                  style: _getTextStyle(
                      fontSize: 16,
                      fontColor: Colors.black,
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