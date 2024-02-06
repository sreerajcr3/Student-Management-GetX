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

class EditStudent extends StatelessWidget {
  final String name;
  final String domain;
  final String batch;
  final String image;
  final int id;
  EditStudent(
      {super.key,
      required this.name,
      required this.domain,
      required this.batch,
      required this.image, required this.id});

  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  File? pickedFile;

  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    imagePickerController.selectedImagePath.value = image;
    final nameController = TextEditingController(text: name);

    final domainController = TextEditingController(text: domain);

    final batchController = TextEditingController(text: batch);

    final studentViewModel = Get.put(StudentViewMode());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
                    child: Obx(
                      () => imagePickerController.selectedImagePath.value == ''
                          ? ClipOval(
                              child: Image.file(File(imagePickerController
                                  .selectedImagePath.value)),
                            )
                          : ClipOval(
                              child: Image.file(File(imagePickerController
                                  .selectedImagePath.value)),
                            ),
                    ),
                  ),
                ),
                height10,
                Text('Add your photo'),
                height40,
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'enter your name',
                      focusColor: Colors.deepOrange),
                ),
                height20,
                TextFormField(
                  controller: domainController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      labelText: 'enter your domain'),
                ),
                height20,
                TextFormField(
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
                      if (nameController.text != '') {
                        studentViewModel.updateStudent(StudentModel(
                            id: id,
                            name: nameController.text,
                            domain: domainController.text,
                            batch: batchController.text,
                            image:
                                imagePickerController.selectedImagePath.value));
                      }
                      Get.snackbar('Congatulations', 'Saved');
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
    );
  }
}
