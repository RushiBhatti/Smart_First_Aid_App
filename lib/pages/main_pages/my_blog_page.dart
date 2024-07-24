import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firstaidapp/utils/blog_container.dart';
import 'package:flutter/material.dart';

class MyBlogPage extends StatefulWidget {
  const MyBlogPage({super.key});

  @override
  State<MyBlogPage> createState() => _MyBlogPageState();
}

class _MyBlogPageState extends State<MyBlogPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      // backgroundColor: Colors.black,
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [

              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("blogs").snapshots(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.active){

                      if(snapshot.hasData && snapshot.data != null){
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context,index){

                                Map<String,dynamic> blogMap = snapshot.data!.docs[index].data() as Map<String,dynamic>;
                                return BlogContainer(
                                    titleText: blogMap["title"],
                                    descriptionText: blogMap["description"],
                                    imagePath: blogMap["imagePath"]
                                );
                              }
                          ),
                        );
                      } else {
                        return const Center(child: Text("\nNo data!"));
                      }

                    }else{
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
