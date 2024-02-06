// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_management_app_final/constants/constants.dart';
import 'package:student_management_app_final/controller/imagePicker_controller.dart';
import 'package:student_management_app_final/model/model.dart';
import 'package:student_management_app_final/view_model/student_view_model.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());
  File? pickedFile;
  ImagePicker imagePicker = ImagePicker();

  final nameController = TextEditingController();

  final domainController = TextEditingController();

  final batchController = TextEditingController();
  final studentViewModel = Get.put(StudentViewMode());

    final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _key,
          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // height10,
                  InkWell(
                    onTap: () {
                      imagePickerController.pickImageFromCamera();
                    },
                    child: CircleAvatar(
                      radius: 80,
                      child: Obx(() => imagePickerController
                                  .selectedImagePath.value ==
                              ''
                          ? Icon(CupertinoIcons.camera_fill)
                          : ClipOval(
                            child: Image.file(File(
                                imagePickerController.selectedImagePath.value)),
                          )),
                    ),
                  ),
                  height10,
                  Text('Add your photo'),
                  height40,
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'The name is empty ';
                      }
                      return null;
                    },
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'enter your name',
                        focusColor: Colors.deepOrange),
                  ),
                  height20,
                  TextFormField(
                      validator: (value) {
                      if (value!.isEmpty) {
                        return 'The domain is empty ';
                      }
                      return null;
                    },
                    controller: domainController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'enter your domain'),
                  ),
                  height20,
                  TextFormField(
                      validator: (value) {
                      if (value!.isEmpty) {
                        return 'The Batch is empty ';
                      }
                      return null;
                    },
                    controller: batchController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'enter your batch'),
                  ),
                  height20,
                  ElevatedButton(
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStatePropertyAll(Colors.white10)),
                      onPressed: () {
                        if ( _key.currentState!.validate()) {
                          var id = DateTime.now().microsecond;
                          studentViewModel.addStudent(StudentModel(
                              id: id,
                              name: nameController.text,
                              domain: domainController.text,
                              batch: batchController.text,
                              image: imagePickerController.selectedImagePath.value));
                               Get.snackbar('Congatulations', 'Saved');
                        }
                       if (imagePickerController.selectedImagePath.value.isEmpty) {
                         Get.snackbar('                 Please select an Image', '',snackPosition:SnackPosition.BOTTOM );
                       }
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(),
                      )),
                  height40,
                  Text('Already registered ? Click here to see the students')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
