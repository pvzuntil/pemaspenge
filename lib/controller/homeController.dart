import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pemaspenge/screen/loginScreen.dart';

class HomeController extends GetxController{
  GetStorage getStorage = GetStorage();

  void doLogout(){
    getStorage.remove('tokenAuth');
    Get.off(LoginScreen());
  }
}