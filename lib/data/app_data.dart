import '../models/fashion_item.dart';
import '../models/story_model.dart';

class AppData {
  static final List<StoryModel> stories = [
    StoryModel(
      imagePath: 'assets/images/model1.jpeg',
      brandLogoPath: 'assets/images/chanellogo.jpg',
      brandName: 'Chanel',
      sharedImagePath: 'assets/images/modelgrid1.jpeg',
    ),
    StoryModel(
      imagePath: 'assets/images/model2.jpeg',
      brandLogoPath: 'assets/images/louisvuitton.jpg',
      brandName: 'Louis Vuitton',
      sharedImagePath: 'assets/images/modelgrid2.jpeg',
    ),
    StoryModel(
      imagePath: 'assets/images/model3.jpeg',
      brandLogoPath: 'assets/images/chloelogo.png',
      brandName: 'Chloé',
      sharedImagePath: 'assets/images/modelgrid3.jpeg',
    ),
    StoryModel(
      imagePath: 'assets/images/model1.jpeg',
      brandLogoPath: 'assets/images/chanellogo.jpg',
      brandName: 'Chanel',
      sharedImagePath: 'assets/images/dress.jpg',
    ),
  ];

  static const List<FashionItem> fashionItems = [
    FashionItem(
      title: 'STREET STYLE',
      brand: 'Louis Vuitton',
      description:
          'Modern şehir stiline uygun, rahat kesimli günlük kombin. Siyah kaban, jean ve sneaker ile güçlü bir görünüm sunar.',
      price: '\$4200',
      mainImage: 'assets/images/modelgrid1.jpeg',
      thumbnailImage: 'assets/images/louisvuitton.jpg',
    ),
    FashionItem(
      title: 'LAMINATED',
      brand: 'Louis Vuitton',
      description:
          'Tek düğmeli, V yaka, uzun kollu ve zarif kesimli kadın kombini. Şık çanta ve geniş paça pantolon ile tamamlandı.',
      price: '\$6500',
      mainImage: 'assets/images/modelgrid2.jpeg',
      thumbnailImage: 'assets/images/dress.jpg',
    ),
    FashionItem(
      title: 'PINK SOFT',
      brand: 'Chloé',
      description:
          'Pembe arka plan üzerinde zarif ve sade bir kadın moda görünümü. Günlük kullanıma uygun modern bir stil.',
      price: '\$3100',
      mainImage: 'assets/images/modelgrid3.jpeg',
      thumbnailImage: 'assets/images/chloelogo.png',
    ),
  ];

  static const String userAvatar = 'assets/images/model1.jpeg';
}