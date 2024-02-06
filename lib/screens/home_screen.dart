// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app_final/constants/constants.dart';
import 'package:student_management_app_final/screens/add_student.dart';
import 'package:student_management_app_final/screens/student_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text('Welcome to student info'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 300,
              child: Image.network(
                  "https://img.freepik.com/free-vector/connected-world-concept-illustration_114360-3027.jpg?w=740&t=st=1706869659~exp=1706870259~hmac=7c13ef9643ec524b785e07e66be795190044af1b6caf885efc14979b3e71452a")),
                  height20,
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(AddStudent());
                  // Get.to(()=> AddStudent());
                  },
                  child: Text("Register"),
                ),
                width20,
                ElevatedButton(
                    onPressed: () {
                    // Get.to(() => StudenntList());
                     Get.to(StudenntList());
                    },
                    child: Text("View Students")),
              ],
            ),
          )
        ],
      ),
    );
  }
}
