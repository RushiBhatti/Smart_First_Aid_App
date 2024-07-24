import "dart:convert";

import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/pages/main_pages/information_page.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _controller = TextEditingController();
  var warningText = "";

  // PROMPT VARIABLES
  String symptoms = "I have some symptoms related to my health,give me: causes,effects"
      ",remedies,important notes to remember and additional tips related to it and give me brief information. symptoms : ";


  // API RELATED VARIABLES
  String answerFromAPI = "";
  String imgLink = "";
  String videoLink = "";
  final String _ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${Globals.apiKeyGemini}";
  final _header = {'Content-Type': 'application/json'};


  // GETTING INFORMATION FROM API...
  void _sendMessage() async {
    setState(() {
      warningText = "Fetching information...";
    });

    symptoms += _controller.text.toString();

    var data = {
      "contents": [
        {
          "parts": [
            {"text": symptoms}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(_ourUrl), headers: _header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);

        answerFromAPI = result['candidates'][0]['content']['parts'][0]['text'];
        setState(() {
          warningText = "";
        });

        Navigator.push(context, MaterialPageRoute(builder: (context){
          return InformationPage(infoText: answerFromAPI);
        }));
      }
    }).catchError((e) {});

  }


  // AFTER ENTERING SYMPTOMS...
  void afterSymptomsEntered(){
    if(_controller.text.isNotEmpty){
      _sendMessage();
      setState(() {
        warningText = "Fetching information...";
        _controller.clear();
      });
    }else{
      setState(() {
        warningText = "Please, Enter Symptoms!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen.shade100,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Center(
            child: SizedBox(
              width: 300,
              child: TextField(
                controller: _controller,
                onSubmitted: (value) => afterSymptomsEntered(),
                decoration: InputDecoration(
                  label: const Text("Enter Symptoms..."),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                  prefixIcon: const Icon(Icons.question_mark_rounded),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () => afterSymptomsEntered(), child: const Text("Get Information")),

          const SizedBox(
              height: 30,
          ),

          Text(warningText,style: const TextStyle(
                fontSize: 20,
                letterSpacing: 1,
                color: Colors.red
          ),),

          const SizedBox(height: 10,),

          const Text("(NOTE : Information in this app is for quick guidance only.\n"
              "So do not rely completely on this information.\n"
              "Please consult a doctor. )", style: TextStyle(
              fontSize: 10,
              color: Colors.black54
          ),),

        ],
      ),

    );
  }
}
