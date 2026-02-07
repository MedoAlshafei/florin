import 'package:florin/features/home/domain/entities/product.dart';
import 'package:flutter/material.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/search_bar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/categories_section.dart';
import '../widgets/product_grid.dart';
import '../widgets/offers_slider.dart';
import '../widgets/testimonials_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.product});

  final List<Product> product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f8f6),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: HomeAppBar()),
            const SliverToBoxAdapter(child: SearchBarWidget()),
            const SliverToBoxAdapter(child: HeroBanner()),
            const SliverToBoxAdapter(child: CategoriesSection()),
            SliverToBoxAdapter(child: ProductGrid(products: product)),
            const SliverToBoxAdapter(child: OffersSlider()),
            const SliverToBoxAdapter(child: TestimonialsSection()),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
    );
  }
}
