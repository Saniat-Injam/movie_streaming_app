import 'package:get/get.dart';
import 'package:movie_streaming_app/features/auth/screen/login_screen.dart';
import 'package:movie_streaming_app/features/splash_onb_screen/views/splash_screen.dart';

class AppRoute {
  static String loginScreen = "/loginScreen";
  static String splashScreen = "/splashScreen";

  static String getLoginScreen() => loginScreen;
  static String getSpalashScreen() => splashScreen;

  static List<GetPage> routes = [
    GetPage(name: loginScreen, page: () => const LoginScreen()),
    GetPage(name: splashScreen, page: () => const SplashScreen()),
  ];
}
