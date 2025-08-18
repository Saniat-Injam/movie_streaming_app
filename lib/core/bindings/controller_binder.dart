import 'package:get/get.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';
import 'package:movie_streaming_app/features/splash_screen/controllers/splash_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LogInController>(
    //       () => LogInController(),
    //   fenix: true,
    // );

    Get.put(SplashController());

    //Get.put(() => HomeController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
