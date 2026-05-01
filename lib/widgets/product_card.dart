import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isLiked;
  final VoidCallback onToggleLike;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.isLiked,
    required this.onToggleLike,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // tap card → buka detail
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== GAMBAR + TOMBOL LIKE =====
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(product.imagePath, fit: BoxFit.cover),
                ),
              ),

              // Tombol like (di atas gambar)
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: onToggleLike, // tap heart → toggle like
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // ===== NAMA PRODUK =====
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),

          // ===== RATING =====
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 2),
              Text(
                '${product.rating} (${product.reviewCount})',
                style: TextStyle(fontSize: 11, color: Colors.grey[600]),
              ),
            ],
          ),

          const SizedBox(height: 2),

          // ===== DESKRIPSI =====
          Text(
            product.description,
            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
