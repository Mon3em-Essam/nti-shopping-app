class CategoryResponseDto {
  List<CategoryDto>? list;

  CategoryResponseDto({this.list});

  CategoryResponseDto.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      list = <CategoryDto>[];
      json['list'].forEach((v) {
        list!.add(CategoryDto.fromJson(v));
      });
    }
  }
}

class CategoryDto {
  String? slug;
  String? name;
  String? url;
  String? image;

  CategoryDto({this.slug, this.name, this.url, this.image});

  CategoryDto.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
    image = json['image'];
  }
}