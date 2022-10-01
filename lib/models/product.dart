class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final String category;
  final double price;
  int quantity;

  Product(
      {required this.id, required this.name, required this.image, required this.description, required this.category, required this.price, this.quantity = 0});
}
 /* static final product = [
    new Product(id: 1,
        name: 'Brocolli',
        image: 'https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        category: 'vegetable',
        description: 'from NTUC',
        price: 2.0),

    new Product(
        id: 2,
        name: 'Potato',
        image:
        'https://images.unsplash.com/photo-1518977676601-b53f82aba655?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
        category: 'vegetable',
        description: 'from NTUC',
        price: 5.0),

    new Product(
        id: 3,
        name: 'Salmon',
        image:
        'https://images.unsplash.com/photo-1641898378373-0ef528eec4be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
        category: 'fish',
        description: 'from NTUC',
        price: 6.5),

    new Product(
        id: 4,
        name: 'Sirloin Steak',
        image:
        'https://images.unsplash.com/photo-1603048297172-c92544798d5a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fG1lYXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
        category: 'meat',
        description: 'from NTUC',
        price: 8.5),

    new Product(
        id: 5,
        name: 'Milk',
        image:
        'https://images.unsplash.com/photo-1563636619-e9143da7973b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
        category: 'dairy',
        description: 'from NTUC',
        price: 67.5)
  ];*/
