class ProductEntity {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discount;
  final List<String> images;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discount,
    required this.images,
  });
}