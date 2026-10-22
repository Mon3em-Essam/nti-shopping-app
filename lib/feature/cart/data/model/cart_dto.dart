import 'package:nti_shopping_app/core/constants/app_constants.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';

class CartDto {
  CartDto(this.productId,this.productName,this.currPrice,this.prevPrice,this.image);

  int? productId;
  String? productName;
  double? currPrice;
  double? prevPrice;
  String? image;

  CartDto.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    currPrice = (json['currPrice'] as num?)?.toDouble();
    prevPrice = (json['prevPrice'] as num?)?.toDouble();
    image = json['image'];
  }
  CartEntity toEntity() {
    return CartEntity(
      productId: productId ?? 1,
      productName: productName ?? "T-Shirt oversize",
      currPrice: currPrice ?? 199,
      prevPrice: prevPrice ?? 250,
      image: image ?? AppConstants.placeHolderImage,
    );
  }
}
