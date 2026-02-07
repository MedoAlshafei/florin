import 'package:florin/features/home/domain/repository/home_repository.dart';

import '../entities/product.dart';

class GetProductsUseCase {
  final HomeRepository repo;

  GetProductsUseCase(this.repo);

  Future<List<Product>> call() {
    return repo.getProducts();
  }
}
