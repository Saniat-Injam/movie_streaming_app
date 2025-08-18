import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/login/views/login_screen.dart';

import 'package:movie_streaming_app/features/home/views/home_screen.dart';
import 'package:movie_streaming_app/features/splash_screen/views/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String splashScreen = "/splashScreen";
  static String homeScreen = "/homeScreen";

  static String getLoginScreen() => loginScreen;
  static String getSpalashScreen() => splashScreen;
  static String gethomeScreen() => homeScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
  ];
}
