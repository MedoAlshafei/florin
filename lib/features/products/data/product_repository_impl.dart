import '../domain/repository/product_repository.dart';
import 'remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource remoteDataSource;
  ProductRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Product>> fetchProducts() {
    return remoteDataSource.getProducts();
  }
}
