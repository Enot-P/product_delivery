class ProductEntity {
  final String image;
  final String name;
  final int? weight;
  final String description;
  final int price;
  ProductEntity({
    required this.image,
    required this.name,
    required this.weight,
    required this.price,
    required this.description,
  });

  @override
  String toString() {
    return 'ProductEntity(image: $image, name: $name, weight: $weight, description: $description, price: $price)';
  }
}
