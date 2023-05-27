import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:joboard/controllers/exports.dart';
import 'package:joboard/views/ui/auth/login.dart';
import 'package:joboard/views/ui/mainscreen.dart';
import 'package:joboard/views/ui/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constants/app_constants.dart';
import 'views/common/exports.dart';


Widget defaultHome = const OnBoardingScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final entrypoint = prefs.getBool('entrypoint') ?? false;
  final loggedIn = prefs.getBool('loggedIn') ?? false;

  if(entrypoint && !loggedIn){
    defaultHome = const LoginPage();
  } else if(entrypoint && loggedIn){
    defaultHome = const MainScreen();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
    ChangeNotifierProvider(create: (context) => LoginNotifier()),
    ChangeNotifierProvider(create: (context) => ZoomNotifier()),
    ChangeNotifierProvider(create: (context) => SignUpNotifier()),
    ChangeNotifierProvider(create: (context) => JobsNotifier()),
    ChangeNotifierProvider(create: (context) => BookMarkNotifier()),
    ChangeNotifierProvider(create: (context) => ImageUpoader()),
    ChangeNotifierProvider(create: (context) => ProfileNotifier()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Joboard',
            theme: ThemeData(
              scaffoldBackgroundColor: Color(kLight.value),
              iconTheme: IconThemeData(color: Color(kDark.value)),
              primarySwatch: Colors.grey,
            ),
            home: defaultHome,
          );
        });
  }
}