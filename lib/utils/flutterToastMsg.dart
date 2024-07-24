// ignore_for_file: file_names

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class FlutterToastMsg{

  static void toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}