import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:pemaspenge/screen/homeScreen.dart';
import 'package:pemaspenge/screen/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PEMASPENGE',
      initialRoute: '/login',
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
