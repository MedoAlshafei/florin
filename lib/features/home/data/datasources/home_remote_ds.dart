import 'package:florin/core/const/app_string.dart';

import '../../../../core/network/api_client.dart';
import '../models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int perPage = 20,
    String? search,
    int? categoryId,
  });
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient api;

  HomeRemoteDataSourceImpl(this.api);

  @override
  Future<List<ProductModel>> getProducts({
    int page = 1,
    int perPage = 20,
    String? search,
    int? categoryId,
  }) async {
    try {
      final queryParams = {
        'consumer_key': AppString.consumerKey,
        'consumer_secret': AppString.consumerSecret,
        'page': page,
        'per_page': perPage,
      };
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }
      if (categoryId != null) {
        queryParams['category'] = categoryId;
      }
      final response = await api.dio.get(
        'products',
        queryParameters: queryParams,
      );
      return (response.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    } catch (e) {
      // Centralized error handling
      print('API Error: $e');
      return [];
    }
  }
}
