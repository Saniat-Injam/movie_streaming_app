import 'package:get/get.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LogInController>(
    //       () => LogInController(),
    //   fenix: true,
    // );
    //Get.put(() => HomeController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
  }
}
