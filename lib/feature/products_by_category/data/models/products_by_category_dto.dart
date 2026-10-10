import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/products_by_category_entity.dart';

class ProductsByCategoryListDto {
  List<ProductsByCategoryDto>? list;
  int? total;
  int? skip;
  int? limit;

  ProductsByCategoryListDto({this.list, this.total, this.skip, this.limit});

  ProductsByCategoryListDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductsByCategoryDto>[];
      json['list'].forEach((v) {
        list!.add(ProductsByCategoryDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }
}

class ProductsByCategoryDto {
  int? id;
  String? title;
  String? description;
  String? category;
  double? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  List<String>? tags;
  String? brand;
  String? sku;
  int? weight;
  String? warrantyInformation;
  String? shippingInformation;
  String? availabilityStatus;
  String? returnPolicy;
  int? minimumOrderQuantity;
  List<String>? images;
  String? thumbnail;

  ProductsByCategoryDto({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,

    this.returnPolicy,
    this.minimumOrderQuantity,

    this.images,
    this.thumbnail,
  });

  ProductsByCategoryDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    stock = json['stock'];
    tags = json['tags'].cast<String>();
    brand = json['brand'];
    sku = json['sku'];
    weight = json['weight'];
    warrantyInformation = json['warrantyInformation'];
    shippingInformation = json['shippingInformation'];
    availabilityStatus = json['availabilityStatus'];

    returnPolicy = json['returnPolicy'];
    minimumOrderQuantity = json['minimumOrderQuantity'];

    images = json['images'].cast<String>();
    thumbnail = json['thumbnail'];
  }

  ProductsByCategoryEntity toEntity() {
    return ProductsByCategoryEntity(
      id: id ?? 0,
      title: title ?? "title",
      description: description ?? "description",
      category: category ?? "category",
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      tags: tags ?? const <String>[],
      brand: brand ?? "brand",
      sku: sku ?? "sku",
      weight: weight ?? 0,
      warrantyInformation: warrantyInformation ?? "warrantyInformation",
      shippingInformation: shippingInformation ?? "shippingInformation",
      availabilityStatus: availabilityStatus ?? "availabilityStatus",
      returnPolicy: returnPolicy ?? "returnPolicy",
      minimumOrderQuantity: minimumOrderQuantity ?? 1,
      images: images ?? const [AppConstants.placeHolderImage],
      thumbnail: thumbnail ?? AppConstants.placeHolderImage,
    );
  }
}
