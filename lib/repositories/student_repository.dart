import 'package:student_management_app_final/database/db_helper.dart';
import 'package:student_management_app_final/database/util.dart';
import 'package:student_management_app_final/model/model.dart';

class StudentRepository {
  DBHelper dbHelper = DBHelper();

  Future<List<StudentModel>> getStudent() async {
    var dbClient = await dbHelper.db;
    List<Map<String, dynamic>> maps = await dbClient
        .query(tableName, columns: ['id', 'name', 'domain', 'batch','image']);
    List<StudentModel> student = [];

    for (var i = 0; i < maps.length; i++) {
      student.add(StudentModel.fromMap(maps[i]));
    }
    print(maps.length);
    print(student.length);
    return student;
  }

  Future<int> add( studentModel) async {
    print("add worked");
    var dbClient = await dbHelper.db;
    return await dbClient.insert(tableName, studentModel.toMap());
  }

  Future<int> update( studentModel) async {
    var dbClient = await dbHelper.db;
    return await dbClient.update(tableName, studentModel.toMap(),
        where: 'id=?', whereArgs: [studentModel.id]);
  }

  Future<int> delete(id) async {
    var dbClient = await dbHelper.db;
    return await dbClient.delete(tableName, where: 'id=?', whereArgs: [id]);
  }
}
