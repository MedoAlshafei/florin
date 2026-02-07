import 'package:florin/features/home/data/models/product_model.dart';

// import '../entities/product.dart';

abstract class HomeRepository {
  Future<List<ProductModel>> getProducts();
}
