import 'package:flutter/material.dart';
import 'package:project_2/student_app/student.dart';

import '../Custom_widget/text_field.dart';
import 'button.dart';
class StudentAdd extends StatefulWidget {
  const StudentAdd({super.key});

  @override
  State<StudentAdd> createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> {
  TextEditingController imgUrl =TextEditingController();
  TextEditingController name =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController dep =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Add"),centerTitle: true,backgroundColor: Colors.blueAccent),
body: ListView(
  children :[
            MyTextField(email: imgUrl, hint: "Enter your Image Url"),
        MyTextField(email: name, hint: "Enter your Name"),
        MyTextField(email: phone, hint: "Enter your Phone"),
        MyTextField(email: email, hint: "Enter your Email"),
        MyTextField(email: dep, hint: "Enter your Department"),
        MyButton(bName: "Add",onTap: (){
          var s = {
            "id": "101",
            "image": imgUrl.text,
            "name": name.text,
            "phone":phone.text,
            "email": email.text,
            "dep": dep.text,
            "isActive": true,
          };
          Students.std.add(s);
          Navigator.pop(context);
            },),
            ],
        )
    );
  }
}
