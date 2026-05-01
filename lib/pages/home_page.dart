import 'package:flutter/material.dart';
import '../data/product_data.dart';
import '../models/product.dart';
import '../widgets/category_selector.dart';
import '../widgets/product_sliver_grid.dart';
import '../widgets/promo_carousel.dart';
import '../widgets/search_box.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Set<int> _likedProductIds = {};
  String _selectedCategory = 'All';

  List<Product> get _filteredProducts {
    if (_selectedCategory == 'All') return products;
    return products.where((p) => p.category == _selectedCategory).toList();
  }

  void _toggleLike(int productId) {
    setState(() {
      if (_likedProductIds.contains(productId)) {
        _likedProductIds.remove(productId);
      } else {
        _likedProductIds.add(productId);
      }
    });
  }

  void _openDetail(Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => DetailPage(
          product: product,
          isLiked: _likedProductIds.contains(product.id),
          onToggleLike: () => _toggleLike(product.id),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const SearchBox(),
                  const SizedBox(height: 16),
                  const PromoCarousel(),
                  const SizedBox(height: 20),
                  const _SectionTitle('Categories'),
                  const SizedBox(height: 10),
                  CategorySelector(
                    categories: categories,
                    images: categoryImages,
                    selectedCategory: _selectedCategory,
                    onSelected: (category) {
                      setState(() => _selectedCategory = category);
                    },
                  ),
                  const SizedBox(height: 20),
                  const _SectionTitle('Browse Products'),
                  const SizedBox(height: 12),
                ]),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
              sliver: ProductSliverGrid(
                products: _filteredProducts,
                likedProductIds: _likedProductIds,
                onToggleLike: _toggleLike,
                onProductTap: _openDetail,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );
  }
}
