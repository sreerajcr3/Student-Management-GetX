import 'package:get/get.dart';
import 'package:student_management_app_final/model/model.dart';
import 'package:student_management_app_final/repositories/student_repository.dart';

class StudentViewMode extends GetxController {
  var allstudent = <StudentModel>[].obs;
  StudentRepository studentRepository = StudentRepository();

  @override
  void onInit() {
    fetchAllStudent();
    super.onInit();
  }

  fetchAllStudent() async {
    var student = await studentRepository.getStudent();
    allstudent.value = student;
  
  }

  addStudent(StudentModel studentModel) {
    print("Add student worked");
    studentRepository.add(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.update(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id) {
    studentRepository.delete(id);
    fetchAllStudent();
  }
}
