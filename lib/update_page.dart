import 'package:flutter/material.dart';
import 'package:sqlite_crud/database.dart';

import 'model/student_model.dart';

class updatePage extends StatefulWidget {
  // final String name;
  // final String email;
  // final String phone;
  // final String age;
  // final int id;
  final studentModel model;

  const updatePage({super.key, required this.model, required studentModel studentModel});

  @override
  State<updatePage> createState() => _updatePageState();
}

class _updatePageState extends State<updatePage> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.model.name);
    emailController = TextEditingController(text: widget.model.email);
    phoneController = TextEditingController(text: widget.model.phone);
    ageController = TextEditingController(text: widget.model.age);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Text(
              " Update Page",
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
                      Updatedata();
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Update data",
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

  Updatedata() {
    DataBaseHelper().updateData(studentModel(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        age: ageController.text
   ));
  }
}
