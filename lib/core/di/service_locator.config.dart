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
import 'package:nti_shopping_app/feature/home/domain/repo/home_repo_interface.dart'
    as _i869;
import 'package:nti_shopping_app/feature/home/domain/use_case/get_categories_use_case.dart'
    as _i632;
import 'package:nti_shopping_app/feature/products_by_category/data/api/products_by_category_api_imp.dart'
    as _i60;
import 'package:nti_shopping_app/feature/products_by_category/data/api/products_by_category_api_interface.dart'
    as _i558;
import 'package:nti_shopping_app/feature/products_by_category/data/repo/products_by_category_data_source_imp.dart'
    as _i465;
import 'package:nti_shopping_app/feature/products_by_category/data/repo/products_by_category_repo_imp.dart'
    as _i762;
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_data_source_interface.dart'
    as _i949;
import 'package:nti_shopping_app/feature/products_by_category/domain/repo/products_by_category_repo_interface.dart'
    as _i994;
import 'package:nti_shopping_app/feature/products_by_category/domain/usecase/products_by_category_get_usecase.dart'
    as _i394;
import 'package:nti_shopping_app/feature/products_by_category/presentation/view_model/cubit/products_by_category_cubit.dart'
    as _i873;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i558.ProductsByCategoryApiInterface>(
      () => _i60.ProductsByCategoryApiImp(),
    );
    gh.factory<_i949.ProductsByCategoryDataSourceInterface>(
      () => _i465.ProductsByCategoryDataSourceImp(
        api: gh<_i558.ProductsByCategoryApiInterface>(),
      ),
    );
    gh.factory<_i632.GetCategoriesUseCase>(
      () => _i632.GetCategoriesUseCase(homeRepo: gh<_i869.HomeRepoInterface>()),
    );
    gh.factory<_i994.ProductsByCategoryRepoInterface>(
      () => _i762.ProductsByCategoryRepoImp(
        dataSource: gh<_i949.ProductsByCategoryDataSourceInterface>(),
      ),
    );
    gh.factory<_i394.ProductsByCategoryGetUsecase>(
      () => _i394.ProductsByCategoryGetUsecase(
        categoryProductsRepo: gh<_i994.ProductsByCategoryRepoInterface>(),
      ),
    );
    gh.factory<_i873.ProductsByCategoryCubit>(
      () => _i873.ProductsByCategoryCubit(
        gh<_i394.ProductsByCategoryGetUsecase>(),
      ),
    );
    return this;
  }
}
