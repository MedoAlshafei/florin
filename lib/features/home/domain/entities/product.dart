import 'package:florin/features/home/data/models/product_model.dart';

class Product {
  final int id;
  final String name;
  final String? slug;
  final String? permalink;
  final DateTime? dateCreated;
  final String type;
  final String? status;
  final bool? featured;
  final String price;
  final String? regularPrice;
  final String? salePrice;
  final bool? onSale;
  final bool? purchasable;
  final Dimensions? dimensions;
  final List<CategoryModel> categories;
  final List<ProductImageModel> images;
  final String? stockStatus;
  final String? priceHtml;
  final List<int>? relatedIds;

  const Product({
    required this.id,
    required this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    required this.type,
    this.status,
    this.featured,
    required this.price,
    this.regularPrice,
    this.salePrice,
    this.onSale,
    this.purchasable,
    this.dimensions,
    required this.categories,
    required this.images,
    this.stockStatus,
    this.priceHtml,
    this.relatedIds,
  });
}
