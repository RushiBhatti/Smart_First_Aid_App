import 'package:flutter/material.dart';

class MyQuickSheetPage extends StatelessWidget {

  var commonSymptoms = ["COMMON COLD", "Fever", "Headache","Cough","Sore throat","Runny or stuffy nose","Constipation"];
  var medicines = [
    "Medicines : Cofsils, Solvin cough tablets\nDrink Turmeric Milk.",
    "Medicine : Paracetamol Dolo\nDrink Turmeric Milk.",
    "Medicine : Combiflam",
    "Medicine : Jincold for Cough\nDrink Turmeric Milk.",
    "Medicine : ThroatCalm",
    "Nasal Spray : Simply Saline",
    "Medicine : Dulcoflex",
  ];

  MyQuickSheetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          const SizedBox(height: 20,),

          const Text("List of Common Symptoms and Their\nMedicines for Quick Reference!", style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),),

          const SizedBox(height: 10,),

          const Divider(
            color: Colors.black,
            indent: 20,
            endIndent: 20,
            thickness: 2,
            height: 10,
          ),

          const SizedBox(height: 10,),

          const Text("(NOTE : This information is for quick guidance only.\n"
              "So do not rely completely on this information.\n"
              "Please consult a doctor. )", style: TextStyle(
            fontSize: 10,
            color: Colors.black54
          ),),

          const SizedBox(height: 20,),

          SizedBox(
            height: 500,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text("${index + 1}",style: const TextStyle(fontSize: 18),),
                  title: Text(commonSymptoms[index]),
                  subtitle: Text(medicines[index]),
                );
              },
              itemCount: commonSymptoms.length,
              padding: const EdgeInsets.all(15),
            ),
          ),
        ],
      ),
    );
  }
}
