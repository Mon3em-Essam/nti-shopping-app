import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/core/widgets/custom_button.dart';
import 'package:nti_shopping_app/feature/product_details/domain/entities/product_entity.dart';
import 'package:nti_shopping_app/feature/product_details/presentation/view/widgets/details_image.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity product;

  const ProductDetails({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text("Details", style: Theme.of(context).textTheme.bodyLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DetailsImage(images: product.images),
              ProductData(
                title: product.title,
                discount: product.discount,
                price: product.price,
              ),
              SizedBox(height: 33),
              ProductDescription(description: product.description),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: CustomButton(
            text: "Add to cart",
            onTap: () {},
            colors: [AppColors.blackButtonColor, AppColors.blackButtonColor],
          ),
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(description, style: Theme.of(context).textTheme.labelLarge);
  }
}

class ProductData extends StatelessWidget {
  const ProductData({
    super.key,
    required this.title,
    required this.discount,
    required this.price,
  });
  final String title;
  final double discount;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: .end,
          children: [
            Text(
              "EGP $price",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(width: 5),
            Text(
              "Disc:$discount%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.discountColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
