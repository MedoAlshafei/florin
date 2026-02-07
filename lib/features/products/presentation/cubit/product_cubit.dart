import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/fetch_products_usecase.dart';
import '../../domain/repository/product_repository.dart';

class ProductCubit extends Cubit<ProductState> {
  final FetchProductsUseCase fetchProductsUseCase;
  ProductCubit(this.fetchProductsUseCase) : super(ProductInitial());

  Future<void> fetchProducts() async {
    emit(ProductLoading());
    try {
      final products = await fetchProductsUseCase();
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }
}

abstract class ProductState {}
class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> products;
  ProductLoaded(this.products);
}
class ProductError extends ProductState {
  final String message;
  ProductError(this.message);
}
