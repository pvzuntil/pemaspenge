import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pemaspenge/controller/loginController.dart';
import 'package:pemaspenge/theme/style.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  void initState() {
    super.initState();
    KeyboardVisibility.onChange.listen((bool visible) {
      loginController.changeKeyboardOpen(visible);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    final ScreenUtil scu = ScreenUtil();

    return Scaffold(
      body: Stack(
        children: [
          BackgroundLoginPage(scu: scu),
          ImageIllustration(),
          Content(
            scu: scu,
            loginController: loginController,
          ),
        ],
      ),
    );
  }
}

class ImageIllustration extends StatelessWidget {
  const ImageIllustration({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => _.isKeyboardOpen
          ? SizedBox.shrink()
          : Positioned(
              right: 10,
              bottom: -30,
              child: SizedBox(
                height: 250,
                width: 500,
                child: LottieBuilder.asset('assets/login_anim.json'),
              ),
            ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({
    Key key,
    @required this.scu,
    @required this.loginController,
  }) : super(key: key);

  final ScreenUtil scu;
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scu.screenWidth,
      height: scu.screenHeight,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: scu.screenWidth * 10 / 100,
          vertical: scu.screenHeight * 10 / 100,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'SILAHKAN MASUK',
                style: GoogleFonts.poppins(
                  fontSize: 10 * scu.pixelRatio,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              child: Text(
                'untuk melanjutkan',
                style: GoogleFonts.poppins(
                  fontSize: 5 * scu.pixelRatio,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: scu.screenHeight * 5 / 100),
            FormLabel(scu: scu, label: 'Email'),
            FormTextFieldEmail(
              scu: scu,
              loginController: loginController,
            ),
            SizedBox(height: scu.screenHeight * 2 / 100),
            FormLabel(scu: scu, label: 'Password'),
            FormTextFieldPassword(
              loginController: loginController,
              scu: scu,
            ),
            SizedBox(height: scu.screenHeight * 2 / 100),
            Container(
              width: double.infinity,
              child: Text(
                'Lupa Password ?',
                style: GoogleFonts.poppins(
                  fontSize: 4 * scu.pixelRatio,
                  color: Colors.white,
                ),
                textAlign: TextAlign.end,
              ),
            ),
            SizedBox(height: scu.screenHeight * 2 / 100),
            ButtonLogin(
              loginController: loginController,
            )
          ],
        ),
      ),
    );
  }
}

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key key,
    @required this.loginController,
  }) : super(key: key);

  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Obx(
        () => RaisedButton(
          onPressed: () => {
            !loginController.isLoginProcess.value ?
            loginController.doLogin() : null,
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          child: !loginController.isLoginProcess.value
              ? Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                )
              : Container(
                  height: 20,
                  width: 20,
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
          color: Color(0xFF7638C2),
        ),
      ),
    );
  }
}

class FormLabel extends StatelessWidget {
  const FormLabel({
    Key key,
    @required this.scu,
    @required this.label,
  }) : super(key: key);

  final ScreenUtil scu;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: FormStyle.label(scu),
    );
  }
}

class FormTextFieldEmail extends StatelessWidget {
  const FormTextFieldEmail({
    Key key,
    @required this.scu,
    @required this.loginController,
  }) : super(key: key);

  final ScreenUtil scu;
  final LoginController loginController;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: Color(0xFF7638C2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: loginController.emailField,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Masukkan email ...',
          hintStyle: GoogleFonts.poppins(
            color: Colors.black.withAlpha(90),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          border: InputBorder.none,
        ),
        style: GoogleFonts.poppins(
          fontSize: 6 * scu.pixelRatio,
          color: Colors.white,
        ),
      ),
    );
  }
}

class FormTextFieldPassword extends StatelessWidget {
  const FormTextFieldPassword({
    Key key,
    @required this.scu,
    @required this.loginController,
  }) : super(key: key);

  final LoginController loginController;
  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      width: double.infinity,
      // padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
        color: Color(0xFF7638C2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: loginController.passwordField,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: 'Masukkan password ...',
          hintStyle: GoogleFonts.poppins(
            color: Colors.black.withAlpha(90),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          border: InputBorder.none,
        ),
        style: GoogleFonts.poppins(
          fontSize: 6 * scu.pixelRatio,
          color: Colors.white,
        ),
      ),
    );
  }
}

class BackgroundLoginPage extends StatelessWidget {
  const BackgroundLoginPage({
    Key key,
    @required this.scu,
  }) : super(key: key);

  final ScreenUtil scu;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: scu.screenWidth,
      height: scu.screenHeight,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF7638C2),
            Color(0xFF492378),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}
