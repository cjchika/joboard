import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/models/request/auth/login_model.dart';
import 'package:joboard/views/common/custom_btn.dart';
import 'package:joboard/views/common/custom_textfield.dart';
import 'package:joboard/views/common/exports.dart';
import 'package:joboard/views/common/height_spacer.dart';
import 'package:joboard/views/ui/auth/signup.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(builder: (context, loginNotifier, child) {
      loginNotifier.getPrefs();
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: "Login",
              child: loginNotifier.entrypoint && loginNotifier.loggedIn? GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back),
              ):const SizedBox.shrink(),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(padding: EdgeInsets.zero, children: [
              const HeightSpacer(size: 50),
              ReusableText(
                text: "Welcome Back!",
                style: appstyle(30, Color(kDark.value), FontWeight.w600),
              ),
              const HeightSpacer(size: 10),
              ReusableText(
                text: "Fill the details to login to your account.",
                style: appstyle(15, Color(kDarkBlue.value), FontWeight.w600),
              ),
              const HeightSpacer(size: 50),
              CustomTextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                validator: (email) {
                  if (email!.isEmpty || !email.contains("@")) {
                    return "Please enter a valid email";
                  } else {
                    return null;
                  }
                },
              ),
              const HeightSpacer(size: 20),
              CustomTextField(
                controller: password,
                keyboardType: TextInputType.text,
                hintText: "Password",
                obscureText: loginNotifier.obscureText,
                validator: (password) {
                  if (password!.isEmpty || password.length < 7) {
                    return "Please enter a valid password";
                  } else {
                    return null;
                  }
                },
                suffixIcon: GestureDetector(
                  onTap: () {
                    loginNotifier.obscureText = !loginNotifier.obscureText;
                  },
                  child: Icon(
                    loginNotifier.obscureText
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Color(kDark.value),
                  ),
                ),
              ),
              const HeightSpacer(size: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => const RegistrationPage());
                  },
                  child: ReusableText(
                    text: "Register",
                    style: appstyle(14, Color(kDark.value), FontWeight.w500),
                  ),
                ),
              ),
              const HeightSpacer(size: 50),
              CustomButton(onTap: () {
               if(loginNotifier.validateAndSave()) {
                 LoginModel model = LoginModel(email: email.text, password: password.text);
                 loginNotifier.userLogin(model);
               } else{
                 Get.snackbar(
                   "Sign in Failed",
                   "Please confirm your credentials",
                   colorText: Color(kLight.value),
                   backgroundColor: Colors.red,
                   icon: const Icon(Icons.add_alert),
                 );
               }
              }, text: "Login"),
            ]),
          ));
    });
  }
}
