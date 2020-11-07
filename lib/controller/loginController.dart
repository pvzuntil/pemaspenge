import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:pemaspenge/global.dart';
import 'package:pemaspenge/model/DoLoginModel.dart';
import 'package:pemaspenge/model/LoginModel.dart';
import 'package:pemaspenge/screen/homeScreen.dart';

class LoginController extends GetxController {
  bool isKeyboardOpen;
  TextEditingController emailField = TextEditingController();
  TextEditingController passwordField = TextEditingController();
  
  LoginModel resultDoLogin;
  GetStorage getStorage = GetStorage();
  
  final isLoginProcess = false.obs;

  @override
  void onInit() async {
    super.onInit();
    isKeyboardOpen = false;
  }

  void changeKeyboardOpen(bool state) {
    isKeyboardOpen = state;
    update();
  }

  void closeDialogJajal() => Get.back();

  void doLogin() async {
    print('start req');
    isLoginProcess.value = true;
    var data =
        DoLoginModel(email: emailField.text, password: passwordField.text)
            .toJson();

    var res = await http.post(
      GlobalVariable.apiUrl() + 'auth/signin',
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json"},
    );

    resultDoLogin = LoginModel.fromJson(jsonDecode(res.body));

    isLoginProcess.value = false;
    print(jsonEncode(data));
    print('finish');
    if (resultDoLogin.status == 0) {
      return Get.snackbar('Gagal !', resultDoLogin.message.toUpperCase(),
          snackPosition: SnackPosition.BOTTOM,
          margin: EdgeInsets.all(0),
          barBlur: 0,
          borderRadius: 0,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white);
    }

    getStorage.write('tokenAuth', resultDoLogin.data.token);
    return Get.off(HomeScreen());
  }
}
