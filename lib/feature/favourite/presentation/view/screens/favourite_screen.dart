import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/favourite/domain/entities/favourite_entity.dart';
import 'package:nti_shopping_app/feature/favourite/presentation/view_model/cubit/favourite_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late FavouriteCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        _cubit = serviceLocator<FavouriteCubit>()
          ..intent(GetFavouritesIntent());
        return _cubit;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.maybePop(context);
            },
          ),
          title: const Text(
            'My Favourite',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<FavouriteCubit, FavouriteState>(
          builder: (context, state) {
            if (state is FavouriteSuccess) {
              final data = state.data;
              if (data.isEmpty) {
                return _buildEmptyState();
              }
              return _buildGridView(data);
            } else if (state is FavouriteLoading) {
              final data = state.data;
              return Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  _buildGridView(data),
                  CircularProgressIndicator(color: AppColors.primaryColor),
                ],
              );
            } else if (state is FavouriteError) {
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
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 100, color: Colors.black87),
          SizedBox(height: 20),
          Text(
            'There are no products in your\nfavourite list',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black87,
              height: 1.4,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGridView(List<FavouriteEntity> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: GridView.builder(
        key: const PageStorageKey('favourite_grid'),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];
          return ProductItemCard(
            onTap: () {},
            favoriteOnTap: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                _cubit.intent(RemoveFromFavouriteIntent(item.id));
              },
              icon: const Icon(Icons.favorite, color: Colors.red),
            ),
            title: item.title,
            discount: item.discountPercentage,
            price: item.price,
            rating: item.rating,
            image: item.images.isNotEmpty ? item.images[0] : '',
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 163 / 288,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
        ),
      ),
    );
  }

  Widget _buildLoadingSkeletonizer() {
    return Skeletonizer(
      enabled: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: GridView.builder(
          itemCount: 8,
          itemBuilder: (context, index) => ProductItemCard(
            onTap: () {},
            title: "Product Title",
            discount: 0,
            price: 0,
            rating: 0.0,
            image: '',
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 163 / 288,
            crossAxisSpacing: 16,
            mainAxisSpacing: 24,
          ),
        ),
      ),
    );
  }
}
