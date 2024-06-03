import 'package:flutter/material.dart';
import 'package:sqlite_crud/database.dart';
import 'package:sqlite_crud/update_page.dart';

import 'insert_page.dart';
import 'model/student_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<studentModel> students = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Center(
            child: Text(
              "SQFLITE CRUD",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => insertPage(),
                ));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: RefreshIndicator(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) => Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name: ${students[index].name}"),
                        Text("Email: ${students[index].email}"),
                        Text("Phone: ${students[index].phone}"),
                        Text("Age: ${students[index].age}"),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => updatePage(
                                          studentModel: students[index],
                                          model: studentModel(
                                              age: "${students[index].age}",
                                              name: "${students[index].name}",
                                              email: "${students[index].email}",
                                              phone: "${students[index].phone}"),
                                        )));
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("Delete"),
                                  content:
                                      Text("Are you sure you want to delete?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          DataBaseHelper()
                                              .deleteRow(students[index].id!);
                                          setState(() {});
                                          getData();
                                          Navigator.pop(context);
                                        },
                                        child: Text("Yes")),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("No"))
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            onRefresh: () {
              return getData();
            }));
  }

  getData() async {
    var data = await DataBaseHelper().getStudentData();
    students = data;
    setState(() {});
  }
}
