import 'package:flutter/material.dart';
import '../../domain/repository/product_repository.dart';

class ProductListWidget extends StatelessWidget {
  final List<Product> products;
  const ProductListWidget({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text('Product'), // TODO: Show product details
        );
      },
    );
  }
}
