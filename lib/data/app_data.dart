import '../models/fashion_item.dart';
import '../models/story_model.dart';

class AppData {
  static const List<StoryModel> stories = [
    StoryModel(
      imagePath: 'assets/images/model1.jpeg',
      brandLogoPath: 'assets/images/chanellogo.jpg',
      brandName: 'Chanel',
    ),
    StoryModel(
      imagePath: 'assets/images/model2.jpeg',
      brandLogoPath: 'assets/images/louisvuitton.jpg',
      brandName: 'Louis Vuitton',
    ),
    StoryModel(
      imagePath: 'assets/images/model3.jpeg',
      brandLogoPath: 'assets/images/chloelogo.png',
      brandName: 'Chloé',
    ),
    StoryModel(
      imagePath: 'assets/images/model1.jpeg',
      brandLogoPath: 'assets/images/chanellogo.jpg',
      brandName: 'Chanel',
    ),
  ];

  static const FashionItem detailItem = FashionItem(
    title: 'LAMINATED',
    brand: 'Louis vuitton',
    description: 'One button V-neck sling long-sleeved waist female stitching dress',
    price: '\$6500',
    mainImage: 'assets/images/modelgrid2.jpeg',
    thumbnailImage: 'assets/images/dress.jpg',
  );

  static const List<String> postGridImages = [
    'assets/images/modelgrid1.jpeg',
    'assets/images/modelgrid2.jpeg',
    'assets/images/modelgrid3.jpeg',
  ];

  static const String userAvatar = 'assets/images/model1.jpeg';
  static const String tagLeftLogo = 'assets/images/louisvuitton.jpg';
  static const String tagRightLogo = 'assets/images/chloelogo.png';
}