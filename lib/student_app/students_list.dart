import 'package:flutter/material.dart';
import 'package:project_2/student_app/student.dart';
import 'package:project_2/student_app/student_add.dart';
import 'package:project_2/student_app/student_edit.dart';
import 'package:project_2/student_app/students_details.dart';

import '../Custom_widget/text widget.dart';
import '../Custom_widget/text_field.dart';

class StudentsList extends StatefulWidget {
  const StudentsList({super.key});

  @override
  State<StudentsList> createState() => _StudentsListState();
}

class _StudentsListState extends State<StudentsList> {
  List stdList = Students.std;
  TextEditingController searchController = TextEditingController();
  List tempList = [];

  refFun() {
    tempList.addAll(Students.std);
    setState(() {});
  }

   searchData() {
    tempList = Students.std
        .where(
          (value) =>
              value['name'].toString().toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    tempList = Students.std;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              refFun();
            },
            icon: Icon(Icons.refresh, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentAdd()),
                ).then((v) {
                  setState(() {});
                });
              },
              icon: Icon(Icons.add_box_rounded, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: MyTextField(email: searchController, hint: "search"),
              ),
              IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
              ),
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: tempList.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentsDetails(
                        img: Students.std[index]["image"],
                        name: Students.std[index]['name'],
                        phone: Students.std[index]['phone'],
                        email: Students.std[index]['email'],
                        dep: Students.std[index]['dep'],
                        status: Students.std[index]['status'],
                      ),
                    ),
                  ).then((v) {
                    setState(() {});
                  });
                },
                tileColor: Colors.black12,
                leading: CircleAvatar(
                  child: MyTextWidget(
                    title: "${tempList[index]["id"]}",
                    tSize: 20,
                  ),
                ),
                title: MyTextWidget(title: "${tempList[index]["name"]}"),
                subtitle: MyTextWidget(
                  title: "${tempList[index]["email"]}",
                  tSize: 15,
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentEdit(
                              imgUrl: Students.std[index]["image"],
                              name: Students.std[index]['name'],
                              phone: Students.std[index]['phone'],
                              email: Students.std[index]['email'],
                              dep: Students.std[index]['dep'],
                              index: index,
                            ),
                          ),
                        ).then((v) {
                          setState(() {});
                        });
                      },
                      icon: Icon(Icons.edit_note),
                      //icon: Icon(Icons.edit_note),
                    ),
                    IconButton(
                      onPressed: () {
                        tempList.removeAt(index);
                        setState(() {});
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

