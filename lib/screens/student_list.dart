// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_management_app_final/screens/edit_page.dart';
import 'package:student_management_app_final/view_model/student_view_model.dart';

class StudenntList extends StatefulWidget {
  const StudenntList({super.key});

  @override
  State<StudenntList> createState() => _StudenntListState();
}

class _StudenntListState extends State<StudenntList> {
  final studentViewModel = Get.put(StudentViewMode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),
      body: GetBuilder<StudentViewMode>(
        builder: (controller) {
          return Obx(
            () => ListView.builder(
              itemCount: controller.allstudent.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    trailing:IconButton(onPressed: (){Get.to(EditStudent(name: controller.allstudent[index].name, domain: controller.allstudent[index].domain, batch: controller.allstudent[index].batch, image: controller.allstudent[index].image!, id: controller.allstudent[index].id!,));}, icon: Icon(Icons.edit)),
                    leading: CircleAvatar(
                        child: ClipOval(
                            child: Image.file(
                                File(controller.allstudent[index].image!)))),
                    title: Text(controller.allstudent[index].name),
                    // subtitle: Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     // Text(controller.allstudent[index].batch!),
                    //     Text(controller.allstudent[index].domain)
                    //   ],
                    // ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}