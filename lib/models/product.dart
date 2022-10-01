class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final String category;
  final String description;
  int quantity;

  Product({required this.id, required this.name, required this.image, required this.price, this.quantity = 0, required this.category, required this.description});
}
