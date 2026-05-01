import 'package:flutter/material.dart';
import '../data/product_data.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({super.key});

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final _controller = PageController(viewportFraction: 0.94);
  int _activeIndex = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            controller: _controller,
            itemCount: _items.length,
            onPageChanged: (index) => setState(() => _activeIndex = index),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: _PromoCard(item: _items[index]),
            ),
          ),
        ),
        const SizedBox(height: 8),
        _Dots(count: _items.length, activeIndex: _activeIndex),
      ],
    );
  }
}

class _PromoCard extends StatelessWidget {
  final _PromoItem item;

  const _PromoCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: ColoredBox(
        color: item.color,
        child: Stack(
          children: [
            Positioned.fill(
              child: Align(
                alignment: Alignment.centerRight,
                child: Opacity(
                  opacity: 0.42,
                  child: Image.asset(
                    item.imagePath,
                    width: 170,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(18, 16, 120, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.title, style: _titleStyle),
                  const SizedBox(height: 6),
                  Text(item.subtitle, style: _subtitleStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;
  final int activeIndex;

  const _Dots({required this.count, required this.activeIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = activeIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 14 : 5,
          height: 5,
          decoration: BoxDecoration(
            color: isActive
                ? Colors.green
                : Colors.green.withValues(alpha: 0.25),
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }),
    );
  }
}

const _titleStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 16,
  height: 1.15,
  color: Color(0xFF0F8D46),
);

const _subtitleStyle = TextStyle(
  fontSize: 13,
  height: 1.25,
  color: Color(0xFFC5552E),
);

const _items = [
  _PromoItem(
    title: 'Are you a\nFarmer ?',
    subtitle: 'Sell your\nProducts here',
    color: Color(0xFFF8E9C8),
    imagePath: '$imageFolder/all.jpg',
  ),
  _PromoItem(
    title: 'Fresh harvest\nnear you',
    subtitle: 'Shop local\nproducts today',
    color: Color(0xFFDDF4E5),
    imagePath: '$imageFolder/fruits.jpg',
  ),
  _PromoItem(
    title: 'Healthy food\nfor family',
    subtitle: 'Picked daily\nfrom farmers',
    color: Color(0xFFFFE3D6),
    imagePath: '$imageFolder/grains.jpg',
  ),
];

class _PromoItem {
  final String title;
  final String subtitle;
  final Color color;
  final String imagePath;

  const _PromoItem({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.imagePath,
  });
}
