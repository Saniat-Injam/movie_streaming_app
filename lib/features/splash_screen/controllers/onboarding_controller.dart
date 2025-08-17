import 'package:get/get.dart';
import 'package:movie_streaming_app/core/utils/constants/image_path.dart';
import 'package:movie_streaming_app/core/utils/constants/video_path.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import '../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;

  late List<OnboardingModel> pages;

  // video controllers
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  @override
  void onInit() {
    super.onInit();
    pages = [
      OnboardingModel(
        title: "Enjoy Your Movies",
        description: "Stream anywhere, anytime with best quality.",
        images: [ImagePath.movie1, ImagePath.movie2, ImagePath.movie3],
        type: OnboardingType.images,
      ),
      OnboardingModel(
        title: "Unlimited Entertainment",
        description: "All your favorite movies and shows in one place.",
        images: [ImagePath.movie4, ImagePath.movie5, ImagePath.movie6],
        type: OnboardingType.images,
      ),
      OnboardingModel(
        title: "Best Service Features",
        description:
            "The features we provide will guarantee the best quality for your streaming",
        videoPath: VideoPath.sampleVideo,
        profileImage: ImagePath.hermione,
        type: OnboardingType.video,
      ),
    ];
  }

  void onPageChanged(int index) {
    currentPage.value = index;

    // manage video when switching pages
    if (pages[index].type == OnboardingType.video) {
      initVideo(pages[index].videoPath!);
    } else {
      disposeVideo();
    }
  }

  void initVideo(String path) async {
    disposeVideo(); // reset old video

    videoController = VideoPlayerController.asset(path);
    await videoController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: true,
      looping: true,
      showControls: true,
    );

    update(); // refresh UI
  }

  void disposeVideo() {
    videoController?.dispose();
    chewieController?.dispose();
    videoController = null;
    chewieController = null;
  }

  @override
  void onClose() {
    disposeVideo();
    super.onClose();
  }
}
