import 'package:flutter/material.dart';

class MyLoginTextField extends StatelessWidget{
  final IconData icon;
  final String hintText;
  final bool obscureText;
  final TextEditingController? textEditingController;

  const MyLoginTextField({super.key,
    required this.icon,
    required this.hintText,
    required this.obscureText,
    required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: textEditingController,
      decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.deepPurple,),
          // hintText: hintText,
          label: Text(hintText),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          )
      ),
      validator: (value){
        if(value!.isEmpty){
          return "Please, fill this field!";
        }
        return null;
      },
    );
  }
}