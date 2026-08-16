import 'package:flutter/material.dart';

import '../Custom_widget/text widget.dart';

class StudentsDetails extends StatefulWidget {
  StudentsDetails({
    super.key,
    required this.img,
    required this.name,
    required this.phone,
    required this.email,
    required this.dep,
    this.status,
  });
  String img;
  String name;
  String phone;
  String email;
  String dep;
  bool? status;

  @override
  State<StudentsDetails> createState() => _StudentsDetailsState();
}

class _StudentsDetailsState extends State<StudentsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTextWidget(title: "Students Details", tColor: Colors.white),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        actions: [
          widget.status == false
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.greenAccent,
                  ),
                )
              : CircleAvatar(radius: 10, backgroundColor: Colors.red),
          SizedBox(width: 15),
        ],
      ),
      body: Column(
        spacing: 5,
        crossAxisAlignment: CrossAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage("${widget.img}"),
            radius: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [MyTextWidget(title: "${widget.name}", tSize: 30)],
          ),
          MyTextWidget(title: "${widget.phone}", tSize: 20),
          MyTextWidget(title: "${widget.email}", tSize: 20),
          MyTextWidget(title: "${widget.dep}", tSize: 20),
        ],
      ),
    );
  }
}
