import 'package:nti_shopping_app/feature/product_details/domain/entities/product_entity.dart';

class SearchProductEntity {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final List<String> images;
  final String thumbnail;

  const SearchProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.images,
    required this.thumbnail,
  });
  ProductEntity toDetailsEntity() {
  return ProductEntity(
    id: id ,
    title: title,
    description: description,
    price: price ,
    discount: discountPercentage,
    images: images ,
  );
}
}
