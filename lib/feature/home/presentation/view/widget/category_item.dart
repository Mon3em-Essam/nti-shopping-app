import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
            _CategoryItem(name: "name", slug: "ghthhd"),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: 10,
      ),
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
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColorBlack),
        color: Colors.transparent,
      ),
      child: Text(name, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
