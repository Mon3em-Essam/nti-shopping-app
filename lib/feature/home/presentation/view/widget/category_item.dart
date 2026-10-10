import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/feature/home/presentation/view_model/home_cubit.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HICategoriesLoading ||
          current is HICategoriesSuccess ||
          current is HICategoriesError,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final bool isLoading =
            cubit.categories.isEmpty && state is! HICategoriesError;

        if (state is HICategoriesError && cubit.categories.isEmpty) {
          return SizedBox(
            height: 40,
            child: Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        return SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: isLoading ? 6 : cubit.categories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              if (isLoading) {
                return const _CategoryItem(
                  name: "Category",
                  slug: "placeholder",
                );
              }

              final category = cubit.categories[index];
              return _CategoryItem(name: category.name, slug: category.slug);
            },
          ),
        );
      },
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({required this.name, required this.slug});

  final String name;
  final String slug;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColorBlack),
        color: Colors.transparent,
      ),
      child: Center(
        child: Text(name, style: Theme.of(context).textTheme.labelMedium),
      ),
    );
  }
}
