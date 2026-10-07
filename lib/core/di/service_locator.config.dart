// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nti_shopping_app/feature/products_by_category/data/api/products_by_category_api.dart'
    as _i994;
import 'package:nti_shopping_app/feature/products_by_category/data/repo/products_by_category_data_source_imp.dart'
    as _i465;
import 'package:nti_shopping_app/feature/products_by_category/data/repo/products_by_category_repo_imp.dart'
    as _i762;
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_data_source_interface.dart'
    as _i949;
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_repo_interface.dart'
    as _i994;
import 'package:nti_shopping_app/feature/products_by_category/domain/usecase/get_products_by_category_usecase.dart'
    as _i93;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i994.ProductsByCategoryApiInterface>(
      () => _i994.ProductsByCategoryApiImp(),
    );
    gh.factory<_i949.ProductsByCategoryDataSourceInterface>(
      () => _i465.ProductsByCategoryDataSourceImp(
        api: gh<_i994.ProductsByCategoryApiInterface>(),
      ),
    );
    gh.factory<_i994.ProductsByCategoryRepoInterface>(
      () => _i762.ProductsByCategoryRepoImp(
        dataSource: gh<_i949.ProductsByCategoryDataSourceInterface>(),
      ),
    );
    gh.factory<_i93.GetProductsByCategoryUsecase>(
      () => _i93.GetProductsByCategoryUsecase(
        categoryProductsRepo: gh<_i994.ProductsByCategoryRepoInterface>(),
      ),
    );
    return this;
  }
}
