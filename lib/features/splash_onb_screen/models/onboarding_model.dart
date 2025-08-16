enum OnboardingType { images, video }

class OnboardingModel {
  final String title;
  final String description;
  final List<String>? images;
  final String? videoPath;
  final String? profileImage;
  final OnboardingType type;

  OnboardingModel({
    required this.title,
    required this.description,
    this.images,
    this.videoPath,
    this.profileImage,
    required this.type,
  });
}
