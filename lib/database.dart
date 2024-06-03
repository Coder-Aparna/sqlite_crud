import 'package:sqflite/sqflite.dart';
import 'package:sqlite_crud/model/student_model.dart';

class DataBaseHelper {
  Future<String> createDatabase() async {
    // get you storage path
    var path = await getDatabasesPath();
    // create your database
    var database = "$path/users.db";
    // return database
    return database;
  }

  Future<Database> DataBase() async {
    var dbase = await createDatabase();
    return await openDatabase(dbase, version: 1,
        onCreate: (Database db, int version) async {
          // create table//
          var tableQuery =
              "CREATE TABLE 'students'('id' INTEGER PRIMARY KEY,'name' TEXT, 'email' TEXT, 'phone' TEXT,)";
          await db.execute(tableQuery);
        });
  }

  insertStudent(studentModel data) async {
    var db = await DataBase();
    await db.insert('students',data.ModeltoMap());
  }

  // get entire table's data
  Future<List<studentModel>> getStudentData()async{
    var db = await DataBase();
    List<studentModel> students = [];
    final data  = await db.query("students");
    for(var d in data){
      students.add(studentModel.MaptoModel(d));
    }
    return students;
  }

  // get data based on columns
  Future<List<Map<String, Object?>>> getColumnData()async{
    var db = await DataBase();
    return await db.query("students",columns:['name','email'] );
  }

  // get data based on row
  Future<List<Map<String, Object?>>> getRowData(int id)async{
    var db = await DataBase();
    return await db.query("students",where: 'id = ?',whereArgs:[10] );
  }
// update data in the table
  updateData(studentModel model)async{
    var db = await DataBase();
    await db.update("students",model.ModeltoMap() ,where: "id =?",whereArgs:[model.id]);
  }

  deleteRow(int id)async{
    var db = await DataBase();
    await db.delete("students",where: "id = ?",whereArgs:[id]);
  }

}