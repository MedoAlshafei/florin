import '../repository/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;
  FetchProductsUseCase(this.repository);

  Future<List<Product>> call() {
    return repository.fetchProducts();
  }
}
