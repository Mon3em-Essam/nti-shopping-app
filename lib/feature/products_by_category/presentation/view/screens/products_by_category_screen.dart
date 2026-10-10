import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/products_by_category/domain/entities/products_by_category_entity.dart';
import 'package:nti_shopping_app/feature/products_by_category/presentation/view_model/cubit/products_by_category_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductsByCategoryScreen extends StatefulWidget {
  const ProductsByCategoryScreen({required this.category, super.key});
  final String category;

  @override
  State<ProductsByCategoryScreen> createState() =>
      _ProductsByCategoryScreenState();
}

class _ProductsByCategoryScreenState extends State<ProductsByCategoryScreen> {
  late ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category), centerTitle: true),
      body: BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
        builder: (context, state) {
          if (state is ProductsByCategorySuccess) {
            final data = state.data;
            return _buildGridView(data);
          } else if (state is ProductsByCategoryLoading) {
            final data = state.data;
            return Stack(
              alignment: AlignmentGeometry.bottomCenter,
              children: [
                _buildGridView(data),
                CircularProgressIndicator(color: AppColors.primaryColor),
              ],
            );
          } else if (state is ProductsByCategoryError) {
            return Center(
              child: Text(
                state.error,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return _buildLoadingSkeletonizer();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      context.read<ProductsByCategoryCubit>().intent(
        GetProductsByCategoryIntent(
          widget.category,
          // Limit
        ),
      );
    }
  }

  Widget _buildGridView(List<ProductsByCategoryEntity> data) {
    return GridView.builder(
      key: PageStorageKey('value'),
      controller: _scrollController,
      itemCount: data.length,
      itemBuilder: (context, index) => ProductItemCard(
        onTap: () {},
        title: data[index].title,
        discount: data[index].discountPercentage,
        price: data[index].price,
        rating: data[index].rating,
        image: data[index].images[0],
      ),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 288,
        crossAxisSpacing: 16,
        mainAxisSpacing: 24,
      ),
    );
  }

  Widget _buildLoadingSkeletonizer() {
    return Skeletonizer(
      enabled: true,
      child: GridView.builder(
        itemBuilder: (context, index) => ProductItemCard(
          onTap: () {},
          title: " title",
          discount: 0,
          price: 0,
          rating: 0.0,
          image: 'image',
        ),
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 288,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
        ),
      ),
    );
  }
}
