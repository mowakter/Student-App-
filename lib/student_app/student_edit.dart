import 'package:flutter/material.dart';
import 'package:project_2/student_app/student.dart';

import '../Custom_widget/text_field.dart';
import 'button.dart';
class StudentEdit extends StatefulWidget {
   StudentEdit({super.key,required this.imgUrl,required this.name,required this.phone,required this.email,required this.dep,required this.index});
   String imgUrl;
   String name;
   String phone;
   String email;
   String dep;
   int index;

  @override
  State<StudentEdit> createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> {
  TextEditingController imgUrl =TextEditingController();
  TextEditingController name =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController dep =TextEditingController();

   @override
  void initState() {
    imgUrl.text= widget.imgUrl;
    name.text =  widget.name;
    phone.text = widget.phone;
    email.text = widget.email;
    dep.text = widget .dep;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Edit"),centerTitle: true,backgroundColor: Colors.blueAccent),
body: ListView(
  children :[
    MyTextField(email: imgUrl, hint: "Enter your Image Url"),
        MyTextField(email: name, hint: "Enter your Name"),
        MyTextField(email: phone, hint: "Enter your Phone"),
        MyTextField(email: email, hint: "Enter your Email"),
        MyTextField(email: dep, hint: "Enter your Department"),
        MyButton(bName: "Update",onTap: (){

          Students.std[widget.index]['image'] = imgUrl.text;
          Students.std[widget.index]['name'] = name.text;
          Students.std[widget.index]['phone'] = phone.text;
          Students.std[widget.index]['email'] = email.text;
          Students.std[widget.index]['dep'] = dep.text;
          Navigator.pop(context);
            },),
            ],
        )
    );
  }
}
