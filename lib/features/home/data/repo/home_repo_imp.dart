import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/core/network/result_api.dart';
import 'package:nti_shopping_app/features/home/domain/entities/product_response_entity.dart';
import 'package:nti_shopping_app/features/home/domain/repo/home_data_source_interface.dart';
import 'package:nti_shopping_app/features/home/domain/repo/home_repo_interface.dart';

@Injectable(as: HomeRepoInterface)
class HomeRepoImp implements HomeRepoInterface {
  final HomeDataSourceInterface _dataSource;
  HomeRepoImp(this._dataSource);

  @override
  Future<ResultApi<ProductResponseEntity>> getAllProducts() async =>
      await _dataSource.getAllProducts();
  
}
