import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_delete_cubit/cart_delete_cubit.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_delete_cubit/cart_delete_intent.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.productId,
    required this.productName,
    required this.currPrice,
    required this.prevPrice,
    required this.image,
  });
  final int productId;
  final String productName;
  final double currPrice;
  final double prevPrice;
  final String image;

  @override
  Widget build(BuildContext context) {
    final CartDeleteCubit cubit = serviceLocator<CartDeleteCubit>();
    return BlocProvider<CartDeleteCubit>(
      create: (context) => cubit,
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
        ),
        child: Row(
          crossAxisAlignment: .end,
          children: [
            CachedNetworkImage(imageUrl: image),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Spacer(),
                  Text.rich(
                    TextSpan(
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 18,
                        fontWeight: .w500,
                      ),
                      text: "EGP",
                      children: [
                        TextSpan(
                          style: Theme.of(context).textTheme.bodyLarge,
                          text: currPrice.toString(),
                        ),
                        TextSpan(
                          style: Theme.of(context).textTheme.bodySmall!
                              .copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.orangeLight,
                                decorationColor: AppColors.orangeLight,
                                decorationThickness: 2,
                              ),
                          text: " EGP${prevPrice.toString()}",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            BlocListener<CartDeleteCubit, CartDeleteState>(
              listener: (context, state) {
                if (state is CartDeleteSuccess) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                } else if (state is CartDeleteError) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: IconButton(
                onPressed: () {
                  cubit.intent(CartDeleteItem(productId.toString()));
                },
                icon: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
