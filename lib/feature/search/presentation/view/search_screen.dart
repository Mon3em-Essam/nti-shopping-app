import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/custom_text_form_feild.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/search/domain/entities/search_product_entity.dart';
import 'package:nti_shopping_app/feature/search/presentation/view_model/search_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchCubit _cubit;
  late ScrollController _scrollController;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _cubit = serviceLocator<SearchCubit>();
    _searchController = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _cubit.close();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _cubit.intent(LoadMoreSearchIntent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  controller: _searchController,
                  hint: 'Search for your products',
                  prefixIcon: const Icon(Icons.search),
                  onChanged: (value) {
                    _cubit.intent(SearchQueryChangedIntent(value));
                  },
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      if (state is SearchInitial) {
                        return Center(
                          child: Text(
                            'Search for your products',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      } else if (state is SearchInitialLoading) {
                        return _buildLoadingSkeletonizer();
                      } else if (state is SearchEmpty) {
                        return Center(
                          child: Text(
                            'No products found matching your search',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      } else if (state is SearchSuccess) {
                        return _buildGridView(state.data);
                      } else if (state is SearchLoading) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            _buildGridView(state.data),
                            CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ],
                        );
                      } else if (state is SearchError) {
                        return Center(
                          child: Text(
                            state.error,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridView(List<SearchProductEntity> data) {
    return GridView.builder(
      key: const PageStorageKey('search_grid'),
      controller: _scrollController,
      itemCount: data.length,
      itemBuilder: (context, index) => ProductItemCard(
        onTap: () {},
        title: data[index].title,
        discount: data[index].discountPercentage,
        price: data[index].price,
        rating: data[index].rating,
        image: data[index].images.isNotEmpty ? data[index].images[0] : '',
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.54,
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.54,
          crossAxisSpacing: 16,
          mainAxisSpacing: 24,
        ),
      ),
    );
  }
}
