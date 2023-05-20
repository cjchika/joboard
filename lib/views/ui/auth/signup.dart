import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/common/app_bar.dart';
import 'package:joboard/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../common/app_style.dart';
import '../../common/custom_btn.dart';
import '../../common/custom_textfield.dart';
import '../../common/height_spacer.dart';
import '../../common/reusable_text.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
 
 final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(builder: (context, loginNotifier, child) {
      return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: "Register",
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.arrow_back),
              ),
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
                keyboardType: TextInputType.emailAddress,
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
                    Get.to(() => const LoginPage());
                  },
                  child: ReusableText(
                    text: "Login",
                    style: appstyle(14, Color(kDark.value), FontWeight.w500),
                  ),
                ),
              ),
              const HeightSpacer(size: 50),
              CustomButton(onTap: () {}, text: "Register"),
            ]),
          ));
    });
  }
  }










