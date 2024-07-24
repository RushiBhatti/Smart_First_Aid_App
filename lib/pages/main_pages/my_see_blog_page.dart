import 'package:flutter/material.dart';
import 'dart:io';

class MySeeBlogPage extends StatelessWidget{
  String titleText;
  String descriptionText;
  String imgPath;
  File? _imageFile;

  MySeeBlogPage({super.key, required this.titleText, required this.descriptionText,required this.imgPath}){
    _imageFile = File(imgPath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  const SizedBox(height: 20,),

                  Text(titleText,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    fontSize: 20,
                  ),),

                  Padding(
                    padding: const EdgeInsets.only(top: 20,bottom: 20),
                    child: Image.file(
                      _imageFile!.absolute,
                    )
                  ),

                  Text(descriptionText,style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    fontSize: 16,
                    // overflow: TextOverflow.ellipsis,
                  ),),

                ],
              ),
            ),
          ),
      ),
    );
  }
}