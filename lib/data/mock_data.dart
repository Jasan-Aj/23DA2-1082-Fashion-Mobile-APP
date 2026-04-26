class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
  });
}

final User mockUser = User(
  id: 'u1',
  name: 'Jasan AJ',
  email: 'jasan@gmail.com',
  profileImageUrl: 'images/profile.jpg',
);

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });
}

final List<Product> mockProducts = [
  Product(
    id: '1',
    name: 'Textured Knit Sweater',
    description: 'High-end studio shot of a textured beige cashmere knit sweater.',
    price: 28000,
    imageUrl: 'images/sweater.jpg',
    category: 'New In',
  ),
  Product(
    id: '2',
    name: 'Casual Pop Set',
    description: 'Vibrant color set for a bold look.',
    price: 45000,
    imageUrl: 'images/casual_women.jpg',
    category: 'New In',
  ),
  Product(
    id: '3',
    name: 'Desert Sand Hoodie',
    description: 'Comfortable hoodie in desert sand color.',
    price: 32500,
    imageUrl: 'images/hoodie.jpg',
    category: 'Pants',
  ),
  Product(
    id: '4',
    name: 'Linen Blazer Set',
    description: 'Sophisticated linen blazer set.',
    price: 68000,
    imageUrl: 'images/blazer_women.jpg',
    category: 'Dresses',
  ),
  Product(
    id: '5',
    name: 'Men\'s Classic Blazer',
    description: 'A classic and versatile blazer for men.',
    price: 75000,
    imageUrl: 'images/blazer_men.jpg',
    category: 'New In',
  ),
  Product(
    id: '6',
    name: 'Urban Casual Look',
    description: 'Street-style casual wear for everyday outings.',
    price: 34000,
    imageUrl: 'images/casual2.jpg',
    category: 'New In',
  ),
  Product(
    id: '7',
    name: 'Everyday Casual Set',
    description: 'Perfect for everyday comfort.',
    price: 42000,
    imageUrl: 'images/casual.jpg',
    category: 'Sets',
  ),
];
