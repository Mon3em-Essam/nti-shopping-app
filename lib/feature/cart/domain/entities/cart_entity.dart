import 'package:nti_shopping_app/core/constants/app_constants.dart';

class CartEntity {
  CartEntity({
    this.productId = 1,
    this.productName = "T-Shirt oversize",
    this.currPrice = 199,
    this.prevPrice = 250,
    this.image = AppConstants.placeHolderImage,
  });
  final int productId;
  final String productName;
  final double currPrice;
  final double prevPrice;
  final String image;
}
