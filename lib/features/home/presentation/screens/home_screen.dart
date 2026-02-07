import 'package:florin/features/home/domain/usecase/get_products_usecase.dart';
import 'package:florin/features/home/presentation/cubit/home_cubit.dart';
import 'package:florin/features/home/presentation/widgets/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViews extends StatelessWidget {
  const HomeViews({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(context.read<GetProductsUseCase>()),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (state is HomeLoaded) {
            return HomePage(product: state.products);
          }

          return const SliverFillRemaining(child: SizedBox());
        },
      ),
    );
  }
}
