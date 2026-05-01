import '../models/product.dart';

const imageFolder = 'assets/images';

final List<Product> products = [
  const Product(
    id: 1,
    name: 'Berries',
    description: 'Berries is a sweet fruit with red color.',
    rating: 4.5,
    reviewCount: 872,
    category: 'Fruits',
    imagePath: '$imageFolder/berries.jpg',
  ),
  const Product(
    id: 2,
    name: 'Tulsi',
    description: 'Leaf of berries is very green.',
    rating: 4.9,
    reviewCount: 324,
    category: 'Herbs',
    imagePath: '$imageFolder/tulsi.jpg',
  ),
  const Product(
    id: 3,
    name: 'Milk',
    description: 'Lorem ipsum dolor sit a met, consectetur.',
    rating: 4.5,
    reviewCount: 672,
    category: 'Grains',
    imagePath: '$imageFolder/milk.jpg',
  ),
  const Product(
    id: 4,
    name: 'Tomato',
    description: 'Is tomato a fruit or a vegetable?',
    rating: 4.9,
    reviewCount: 324,
    category: 'Fruits',
    imagePath: '$imageFolder/tomato.jpg',
  ),
  const Product(
    id: 5,
    name: 'Banana',
    description: 'Fresh banana with soft sweet taste.',
    rating: 4.6,
    reviewCount: 518,
    category: 'Fruits',
    imagePath: '$imageFolder/banana.jpg',
  ),
  const Product(
    id: 6,
    name: 'Rice',
    description: 'Organic rice from local farmers.',
    rating: 4.8,
    reviewCount: 421,
    category: 'Grains',
    imagePath: '$imageFolder/rice.jpg',
  ),
  const Product(
    id: 7,
    name: 'Mint',
    description: 'Aromatic leaves for fresh drinks.',
    rating: 4.7,
    reviewCount: 289,
    category: 'Herbs',
    imagePath: '$imageFolder/mint.jpg',
  ),
  const Product(
    id: 8,
    name: 'Corn',
    description: 'Golden corn picked from the field.',
    rating: 4.4,
    reviewCount: 356,
    category: 'Grains',
    imagePath: '$imageFolder/corn.jpg',
  ),
];

final List<String> categories = ['Fruits', 'Grains', 'Herbs'];

final Map<String, String> categoryImages = {
  'All': '$imageFolder/all.jpg',
  'Fruits': '$imageFolder/fruits.jpg',
  'Grains': '$imageFolder/grains.jpg',
  'Herbs': '$imageFolder/Herbs.jpg',
};
