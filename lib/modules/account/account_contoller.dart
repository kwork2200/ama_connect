import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountController extends GetxController {
  var profileImage = ''.obs;

  var isEditing = false.obs;

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  void saveChanges() {
    print('Saving changes...');
    isEditing.value = false;
  }

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImage.value = image.path;
      print('Image selected: ${image.path}');
    }
  }

  Future<void> launchPlayStore() async {
    final Uri url = Uri.parse('https://play.google.com/store/apps/details?id=com.ama.ama_legal_solutions ');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Get.snackbar(
        'Error',
        'Could not open Play Store',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}
