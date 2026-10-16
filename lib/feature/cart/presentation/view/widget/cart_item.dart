import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';

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
    return Container(
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
    );
  }
}
