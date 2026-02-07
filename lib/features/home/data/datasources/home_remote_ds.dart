import 'package:florin/core/const/app_string.dart';

import '../../../../core/network/api_client.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient api;

  HomeRemoteDataSourceImpl(this.api);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await api.dio.get(
      'products',
      queryParameters: {
        'consumer_key': AppString.consumerKey,
        'consumer_secret': AppString.consumerSecret,
      },
    );

    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();

    print(response.data);
  }
}
