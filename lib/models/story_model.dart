class StoryModel {
  final String imagePath;
  final String brandLogoPath;
  final String brandName;
  final String sharedImagePath;
  bool isViewed;

  StoryModel({
    required this.imagePath,
    required this.brandLogoPath,
    required this.brandName,
    required this.sharedImagePath,
    this.isViewed = false,
  });
}