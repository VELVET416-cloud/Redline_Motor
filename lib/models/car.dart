class Car {
  final String id;
  final String name;
  final String details;
  final String price;
  final String imageUrl;
  final bool isFavorite;
  final bool isFeatured;

  Car({
    required this.id,
    required this.name,
    required this.details,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.isFeatured = false,
  });
}
