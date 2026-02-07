import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.permalink,
    required super.dateCreated,
    required super.type,
    required super.status,
    required super.featured,
    required super.price,
    required super.regularPrice,
    required super.salePrice,
    required super.onSale,
    required super.purchasable,
    required super.dimensions,
    required super.categories,
    required super.images,
    required super.stockStatus,
    required super.priceHtml,
    required super.relatedIds,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    permalink: json["permalink"],
    dateCreated: DateTime.parse(json["date_created"]),
    type: json["type"],
    status: json["status"],
    featured: json["featured"],
    price: json["price"],
    regularPrice: json["regular_price"],
    salePrice: json["sale_price"],
    onSale: json["on_sale"],
    purchasable: json["purchasable"],
    dimensions: Dimensions.fromJson(json["dimensions"]),
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
    images: List<ProductImageModel>.from(json["images"].map((x) => ProductImageModel.fromJson(x))),
    stockStatus: json["stock_status"],
    priceHtml: json["price_html"],
    relatedIds: List<int>.from(json["related_ids"].map((x) => x)),
  );
}

class Dimensions {
  final String length;
  final String width;
  final String height;

  Dimensions({required this.length, required this.width, required this.height});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    length: json["length"] ?? "",
    width: json["width"] ?? "",
    height: json["height"] ?? "",
  );
}

class CategoryModel {
  final int id;
  final String name;
  final String slug;

  CategoryModel({required this.id, required this.name, required this.slug});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );
}

class ProductImageModel {
  final int id;
  final String src;
  final String name;
  final String alt;

  ProductImageModel({required this.id, required this.src, required this.name, required this.alt});

  factory ProductImageModel.fromJson(Map<String, dynamic> json) => ProductImageModel(
    id: json["id"],
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );
}
