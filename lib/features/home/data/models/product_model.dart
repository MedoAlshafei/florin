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

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    try {
      return ProductModel(
        id: json["id"] is int ? json["id"] : int.tryParse(json["id"].toString()) ?? 0,
        name: json["name"]?.toString() ?? '',
        slug: json["slug"]?.toString() ?? '',
        permalink: json["permalink"]?.toString() ?? '',
        dateCreated: json["date_created"] != null ? DateTime.tryParse(json["date_created"].toString()) ?? DateTime.now() : DateTime.now(),
        type: json["type"]?.toString() ?? '',
        status: json["status"]?.toString() ?? '',
        featured: json["featured"] ?? false,
        price: json["price"]?.toString() ?? '',
        regularPrice: json["regular_price"]?.toString() ?? '',
        salePrice: json["sale_price"]?.toString() ?? '',
        onSale: json["on_sale"] ?? false,
        purchasable: json["purchasable"] ?? false,
        dimensions: json["dimensions"] != null ? Dimensions.fromJson(json["dimensions"]) : Dimensions(length: '', width: '', height: ''),
        categories: json["categories"] != null
            ? List<CategoryModel>.from((json["categories"] as List).map((x) => CategoryModel.fromJson(x)))
            : [],
        images: json["images"] != null
            ? List<ProductImageModel>.from((json["images"] as List).map((x) => ProductImageModel.fromJson(x)))
            : [],
        stockStatus: json["stock_status"]?.toString() ?? '',
        priceHtml: json["price_html"]?.toString() ?? '',
        relatedIds: json["related_ids"] != null
            ? List<int>.from((json["related_ids"] as List).map((x) => x is int ? x : int.tryParse(x.toString()) ?? 0))
            : [],
      );
    } catch (e) {
      // Optionally log or handle parsing error
      return ProductModel(
        id: 0,
        name: '',
        slug: '',
        permalink: '',
        dateCreated: DateTime.now(),
        type: '',
        status: '',
        featured: false,
        price: '',
        regularPrice: '',
        salePrice: '',
        onSale: false,
        purchasable: false,
        dimensions: Dimensions(length: '', width: '', height: ''),
        categories: [],
        images: [],
        stockStatus: '',
        priceHtml: '',
        relatedIds: [],
      );
    }
  }
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

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      CategoryModel(id: json["id"], name: json["name"], slug: json["slug"]);
}

class ProductImageModel {
  final int id;
  final String src;
  final String name;
  final String alt;

  ProductImageModel({
    required this.id,
    required this.src,
    required this.name,
    required this.alt,
  });

  factory ProductImageModel.fromJson(Map<String, dynamic> json) =>
      ProductImageModel(
        id: json["id"],
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );
}
