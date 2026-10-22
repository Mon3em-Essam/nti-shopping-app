import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';

class FavouriteDto {
  List<FavouriteItemDto>? list;

  FavouriteDto({this.list});

  FavouriteDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <FavouriteItemDto>[];
      json['list'].forEach((v) {
        list!.add(FavouriteItemDto.fromJson(v));
      });
    }
  }
}

class FavouriteItemDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  List<String>? images;
  String? thumbnail;

  FavouriteItemDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.images,
    this.thumbnail,
  });

  FavouriteItemDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = (json['price'] as num?)?.toDouble();
    discountPercentage = (json['discountPercentage'] as num?)?.toDouble();
    rating = (json['rating'] as num?)?.toDouble();
    stock = json['stock'];
    brand = json['brand'];
    images = json['images'] != null ? List<String>.from(json['images']) : null;
    thumbnail = json['thumbnail'];
  }

  FavouriteEntity toEntity() {
    return FavouriteEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      brand: brand ?? '',
      images: images ?? const [AppConstants.placeHolderImage],
      thumbnail: thumbnail ?? AppConstants.placeHolderImage,
    );
  }
}
