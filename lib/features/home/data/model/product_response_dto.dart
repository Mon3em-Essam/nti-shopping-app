import 'package:nti_shopping_app/features/home/domain/entities/product_response_entity.dart';

class ProductResponseDto {
  List<ProductItemDto>? list;
  int? total;
  int? skip;
  int? limit;

  ProductResponseDto({this.list, this.total, this.skip, this.limit});

  ProductResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <ProductItemDto>[];
      json['list'].forEach((v) {
        list!.add(ProductItemDto.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  ProductResponseEntity toEntity() => ProductResponseEntity(
    limit: limit ?? 10,
    total:total ?? 20,
    skip:skip ?? 0,
    list: list?.map((e)=>e.toEntity()).toList() ?? [],
  );
}

class ProductItemDto {
  int? id;
  String? title;
  double? price;
  double? discountPercentage;
  double? rating;
  List<String>? images;

  ProductItemDto({
    this.id,
    this.title,
    this.price,
    this.discountPercentage,
    this.rating,
    this.images,
  });

  ProductItemDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];
    images = json['images'].cast<String>();
  }

  ProductItemEntity toEntity() => ProductItemEntity(
    id: id ?? 0,
    price: price ?? 10,
    discountPercentage: discountPercentage ?? 7 ,
    images:images ?? [],
    rating: rating ?? 5.0,
    title: title ?? "",
  );
}
