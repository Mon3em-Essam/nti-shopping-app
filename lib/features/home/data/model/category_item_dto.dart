import 'package:nti_shopping_app/features/home/domain/entities/category_item_entity.dart';

class CategoryItemDto {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryItemDto({this.slug, this.name});

  CategoryItemDto.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
  }

  CategoryItemEntity toEntity() => CategoryItemEntity(
    name: name ?? "",
    slug: slug ?? "",
    
  );
}
