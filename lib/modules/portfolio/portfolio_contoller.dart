import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PortfolioController extends GetxController {
  var name = 'Krishna'.obs;
  var email = 'kwork2200@gmail.com'.obs;
  var phone = '919328531847'.obs;
  var state = 'Gujarat'.obs;

  var isEditing = false.obs;

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  void saveChanges() {
    print('Saving changes...');
    isEditing.value = false;
  }
}
