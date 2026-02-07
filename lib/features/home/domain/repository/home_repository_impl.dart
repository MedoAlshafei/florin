import 'package:florin/features/home/data/datasources/home_remote_ds.dart';
import 'package:florin/features/home/data/models/product_model.dart';
import 'package:florin/features/home/domain/repository/home_repository.dart';


class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<List<ProductModel>> getProducts() {
    return remote.getProducts();
  }
}
