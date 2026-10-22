import 'package:nti_shopping_app/core/constants/app_constants.dart';

class FavouriteEntity {
  FavouriteEntity({
    this.id = 0,
    this.title = '',
    this.description = '',
    this.category = '',
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.brand = '',
    this.images = const [AppConstants.placeHolderImage],
    this.thumbnail = AppConstants.placeHolderImage,
  });

  int id;
  String title;
  String description;
  String category;
  double price;
  double discountPercentage;
  double rating;
  int stock;
  String brand;
  List<String> images;
  String thumbnail;
}
