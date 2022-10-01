class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final String category;
  final double price;
  int quantity;

  Product({required this.id, required this.name, required this.image, required this.description, required this.category, required this.price, this.quantity = 0});
}
