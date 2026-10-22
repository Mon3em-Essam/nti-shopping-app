import '../../domain/entities/search_product_entity.dart';

class SearchResponseDto {
  List<SearchProductDto>? list;
  int? total;
  int? skip;
  int? limit;

  SearchResponseDto({this.list, this.total, this.skip, this.limit});

  factory SearchResponseDto.fromJson(Map<String, dynamic> json) {
    return SearchResponseDto(
      list:
          (json['list'] as List<dynamic>?)
              ?.map(
                (item) =>
                    SearchProductDto.fromJson(item as Map<String, dynamic>),
              )
              .toList() ??
          [],
      total: (json['total'] as num?)?.toInt() ?? 0,
      skip: (json['skip'] as num?)?.toInt() ?? 0,
      limit: (json['limit'] as num?)?.toInt() ?? 0,
    );
  }
}

class SearchProductDto {
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

  SearchProductDto({
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

  factory SearchProductDto.fromJson(Map<String, dynamic> json) {
    return SearchProductDto(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: (json['stock'] as num?)?.toInt(),
      brand: json['brand'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      thumbnail: json['thumbnail'] as String?,
    );
  }

  SearchProductEntity toEntity() {
    return SearchProductEntity(
      id: id ?? 0,
      title: title ?? '',
      description: description ?? '',
      category: category ?? '',
      price: price ?? 0.0,
      discountPercentage: discountPercentage ?? 0.0,
      rating: rating ?? 0.0,
      stock: stock ?? 0,
      brand: brand ?? '',
      images: images ?? [],
      thumbnail: thumbnail ?? '',
    );
  }
}
