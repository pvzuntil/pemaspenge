import 'package:get/get.dart';

class LoginController extends GetxController{
  bool isKeyboardOpen;

  @override
  void onInit() {
    super.onInit();
    isKeyboardOpen = false;
  }


  void changeKeyboardOpen(bool state){
    isKeyboardOpen = state;
    update();
  }

  void closeDialogJajal() => Get.back();
}