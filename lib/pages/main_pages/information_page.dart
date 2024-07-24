import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/utils/mydrawer.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatelessWidget
{
  final String? infoText;

  const InformationPage({super.key, required this.infoText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: const MyDrawerWidget(),

      appBar: AppBar(
        title: const Text(Globals.appName),
      ),

      body: Container(

        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.tealAccent,
          borderRadius: BorderRadius.circular(12),
        ),

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [

              Container(
                // height: MediaQuery.of(context).size.height * 0.77,
                width: double.infinity,
                // color: Colors.white,
                padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                child: SingleChildScrollView(
                  child: Text(
                    infoText!,
                    style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  // fontFamily: "Josefin",
                  color: Colors.black,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ),

              const Center(
                child: Text(
                  "\nWe Hope, This Will Improve Your Health!"
                      "\n------------------- Thank You! -------------------",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Josefin",
                    color: Colors.black45,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
