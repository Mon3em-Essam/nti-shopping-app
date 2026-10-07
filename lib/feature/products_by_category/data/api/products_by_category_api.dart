import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';

abstract interface class ProductsByCategoryApiInterface {
  ResultApi getProductsByCategory();
}

@Injectable(as: ProductsByCategoryApiInterface)
class ProductsByCategoryApiImp implements ProductsByCategoryApiInterface {
  @override
  ResultApi<dynamic> getProductsByCategory() {
    // TODO: implement getProductsByCategory
    throw UnimplementedError();
  }
}
