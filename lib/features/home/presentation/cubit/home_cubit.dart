import 'package:florin/features/home/data/models/product_model.dart';
import 'package:florin/features/home/domain/usecase/get_products_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetProductsUseCase getProducts;

  HomeCubit(this.getProducts) : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());
    try {
      final products = await getProducts();
      emit(HomeLoaded(products));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
