import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
    required this.email,required this.hint,
  });

  TextEditingController email;
  String hint;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: email,
        //controller: email,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}