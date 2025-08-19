import 'package:get/get.dart';
import 'package:movie_streaming_app/features/home/controllers/home_controller.dart';
import 'package:movie_streaming_app/features/home/models/movie_model.dart';

class TopChartsController extends GetxController {
  final HomeController homeController = Get.find<HomeController>();

  List<Movie> get topCharts => homeController.topCharts;
}
