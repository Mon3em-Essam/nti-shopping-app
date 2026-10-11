import 'package:nti_shopping_app/core/constants/app_constants.dart';

class ProductsByCategoryEntity {
  ProductsByCategoryEntity({
    this.id = 1,
    this.title = "title",
    this.description = "description",
    this.category = "category",
    this.price = 0.0,
    this.discountPercentage = 0.0,
    this.rating = 0.0,
    this.stock = 0,
    this.tags = const <String>[],
    this.brand = "brand",
    this.sku = "sku",
    this.weight = 0,
    this.warrantyInformation = "warrantyInformation",
    this.shippingInformation = "shippingInformation",
    this.availabilityStatus = "availabilityStatus",
    this.returnPolicy = "returnPolicy",
    this.minimumOrderQuantity = 1,
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
  List<String> tags;
  String brand;
  String sku;
  int weight;
  String warrantyInformation;
  String shippingInformation;
  String availabilityStatus;
  String returnPolicy;
  int minimumOrderQuantity;
  List<String> images;
  String thumbnail;
}
