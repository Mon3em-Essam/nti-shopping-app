import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/category_item.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/home_header.dart';
import 'package:nti_shopping_app/feature/home/presentation/view_model/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<HomeCubit>()..intent(HIHomeCalls()),
      child: const _HomeScreenBody(),
    );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),
              const SizedBox(height: 15),
              const CategoriesWidget(),
              const SizedBox(height: 15),
              Expanded(
                child: BlocBuilder<HomeCubit, HomeState>(
                  buildWhen: (previous, current) =>
                      current is HProductsLoading ||
                      current is HProductsSuccess ||
                      current is HProductsError,
                  builder: (context, state) {
                    final cubit = context.read<HomeCubit>();

                    if (state is HProductsLoading && cubit.products.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is HProductsError && cubit.products.isEmpty) {
                      return Center(
                        child: Text(
                          state.error,
                          style: const TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (cubit.products.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }

                    return GridView.builder(
                      itemCount: cubit.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            childAspectRatio: 0.55,
                          ),
                      itemBuilder: (context, index) {
                        final product = cubit.products[index];
                        return ProductItemCard(
                          onTap: () {
                          },
                          title: product.title,
                          discount: product.discountPercentage,
                          price: product.price,
                          rating: product.rating,
                          image: product.images.isNotEmpty
                              ? product.images.first
                              : "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
