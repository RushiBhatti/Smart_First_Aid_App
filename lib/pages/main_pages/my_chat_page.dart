import 'dart:convert';
import 'package:firstaidapp/global_constants/globals.dart';
import 'package:firstaidapp/utils/chat_message.dart';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';

class MyChatPage extends StatefulWidget {
  const MyChatPage({super.key});

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  String geminiReply = "";
  String userMSG = "";
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  // Variables for chat API
  final String _ourUrl =
      "https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=${Globals.apiKeyGemini}";
  final _header = {'Content-Type': 'application/json'};


  // sending msg and receiving response from api
  void _sendMessage() async {

    userMSG = _controller.text.toString();

    if (userMSG.isNotEmpty) {
      setState(() {
        _messages.insert(0, ChatMessage(msg: userMSG, sender: "You"));
        _messages.insert(
            0, ChatMessage(msg: "Bot is typing...", sender: "Bot"));
      });
      _controller.clear();

      userMSG += "  -- Give me answer in brief.";

      var data = {
        "contents": [
          {
            "parts": [
              {"text": userMSG}
            ]
          }
        ]
      };

      // sending to and receiving from api
      await http
          .post(Uri.parse(_ourUrl), headers: _header, body: jsonEncode(data))
          .then((value) {
        if (value.statusCode == 200) {
          var result = jsonDecode(value.body);

          geminiReply = result['candidates'][0]['content']['parts'][0]['text'];

          _messages.removeAt(0);
          setState(() {
            _messages.insert(0, ChatMessage(msg: geminiReply, sender: "Bot"));
          });
        } else {
          geminiReply = "Sorry, Some Error Occur!";
          setState(() {
            _messages.removeAt(0);
            _messages.insert(0, ChatMessage(msg: geminiReply, sender: "Bot"));
          });
        }
      }).catchError((e) {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return _messages[index];
                  })),

          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (value) => _sendMessage,
                  decoration: InputDecoration(
                    hintText: "Enter health related queries...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    suffixIcon: InkWell(
                        onTap: _sendMessage,
                        child: const Icon(Icons.send_rounded)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
