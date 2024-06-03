import 'package:flutter/material.dart';
import 'package:sqlite_crud/database.dart';
import 'package:sqlite_crud/main.dart';
import 'package:sqlite_crud/model/student_model.dart';

class insertPage extends StatefulWidget {
  const insertPage({super.key});

  @override
  State<insertPage> createState() => _insertPageState();
}

class _insertPageState extends State<insertPage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Text(
              " Insert Page",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Container(
          height: 600,
          width: 300,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 160,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Phone",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: InputDecoration(
                        hintText: "Enter Your Age",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  MaterialButton(
                    onPressed: () {
                      DataBaseHelper().insertStudent(studentModel(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                       age: ageController.text
                      ));
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Add data",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blueGrey,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
