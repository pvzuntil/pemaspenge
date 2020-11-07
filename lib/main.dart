import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pemaspenge/screen/homeScreen.dart';
import 'package:pemaspenge/screen/loginScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetStorage getStorage = GetStorage();
    return GetMaterialApp(
      title: 'PEMASPENGE',
      initialRoute: getStorage.hasData('tokenAuth') ? '/' : '/login',
      // initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(
          name: '/login',
          page: () => KeyboardDismissOnTap(
            child: LoginScreen(),
          ),
        )
      ],
    );
  }
}
