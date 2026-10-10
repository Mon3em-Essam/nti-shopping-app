import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/category_item.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/home_header.dart';
import 'package:nti_shopping_app/feature/home/presentation/view_model/home_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final cubit = context.read<HomeCubit>();
              final bool isCategoriesLoading = cubit.categories.isEmpty;
              final bool isProductsLoading =
                  cubit.products.isEmpty && state is! HProductsError;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: 15),

                  // سكشن التصنيفات مع الـ Skeletonizer
                  Skeletonizer(
                    enabled: isCategoriesLoading,
                    effect: const ShimmerEffect(
                      baseColor: Color(0xFFEEEEEE),
                      highlightColor: Color(0xFFFAFAFA),
                    ),
                    child: const CategoriesWidget(),
                  ),

                  const SizedBox(height: 15),

                  // سكشن المنتجات مع الـ Skeletonizer
                  Expanded(
                    child: _buildProductsSection(
                      context,
                      state,
                      cubit,
                      isProductsLoading,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProductsSection(
    BuildContext context,
    HomeState state,
    HomeCubit cubit,
    bool isProductsLoading,
  ) {
    // في حالة وجود خطأ من السيرفر
    if (state is HProductsError && cubit.products.isEmpty) {
      return Center(
        child: Text(state.error, style: const TextStyle(color: Colors.red)),
      );
    }

    // في حالة انتهاء التحميل ولم تعد هناك منتجات
    if (!isProductsLoading && cubit.products.isEmpty) {
      return const Center(child: Text("No products found"));
    }

    // عرض الـ Grid سواء كانت شيمر (أثناء التحميل) أو المنتجات الحقيقية
    return Skeletonizer(
      enabled: isProductsLoading,
      effect: const ShimmerEffect(
        baseColor: Color(0xFFEEEEEE),
        highlightColor: Color(0xFFFAFAFA),
      ),
      child: GridView.builder(
        itemCount: isProductsLoading ? 6 : cubit.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.50, // تم ضبطها لمنع خطأ الـ Overflow
        ),
        itemBuilder: (context, index) {
          if (isProductsLoading) {
            return ProductItemCard(
              onTap: () {},
              title: "Product Title Placeholder",
              discount: 10,
              price: 99.99,
              rating: 4.5,
              image: "",
            );
          }

          final product = cubit.products[index];
          return ProductItemCard(
            onTap: () {},
            title: product.title,
            discount: product.discountPercentage,
            price: product.price,
            rating: product.rating,
            image: product.images.isNotEmpty
                ? product.images.first
                : "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
          );
        },
      ),
    );
  }
}
