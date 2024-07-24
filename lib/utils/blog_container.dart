import 'package:firstaidapp/pages/main_pages/my_see_blog_page.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class BlogContainer extends StatelessWidget {

  String titleText;
  String descriptionText;
  String imagePath;
  File? _imageFile;

  BlogContainer({super.key,required this.titleText,required this.descriptionText, required this.imagePath}){
    _imageFile = File(imagePath);
  }


  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,bottom: 10,top: 10),
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return MySeeBlogPage(titleText: titleText, descriptionText: descriptionText,imgPath: imagePath,);
          }));
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 230,
          width: deviceWidth * 0.9,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  child: Text(titleText,style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    fontSize: 20,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  child: SizedBox(
                    height: 140,
                    width: deviceWidth * 0.9,
                    child: Image.file(
                      _imageFile!.absolute,
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                SizedBox(
                  child: Text(descriptionText,style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    // color: Colors.white,
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}