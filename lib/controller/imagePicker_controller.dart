import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  // var selectedImagePath = false.obs;
  var selectedImagePath = "".obs;

  void pickImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      selectedImagePath.value = pickedImage.path;
    } else {
      Get.snackbar('title', 'message');
    }
  }
}
