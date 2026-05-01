import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_card.dart';

class ProductSliverGrid extends StatelessWidget {
  final List<Product> products;
  final Set<int> likedProductIds;
  final ValueChanged<int> onToggleLike;
  final ValueChanged<Product> onProductTap;

  const ProductSliverGrid({
    super.key,
    required this.products,
    required this.likedProductIds,
    required this.onToggleLike,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 16,
        childAspectRatio: 0.68,
      ),
      delegate: SliverChildBuilderDelegate(childCount: products.length, (
        context,
        index,
      ) {
        final product = products[index];

        return ProductCard(
          product: product,
          isLiked: likedProductIds.contains(product.id),
          onToggleLike: () => onToggleLike(product.id),
          onTap: () => onProductTap(product),
        );
      }),
    );
  }
}
