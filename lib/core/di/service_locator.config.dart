// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:nti_shopping_app/core/di/register_modules.dart' as _i1044;
import 'package:nti_shopping_app/core/storage_helper/app_secure_storage.dart'
    as _i835;
import 'package:nti_shopping_app/core/storage_helper/startup_helper.dart'
    as _i383;
import 'package:nti_shopping_app/feature/favourite/data/repo/data_source/favourite_data_source_imp.dart'
    as _i522;
import 'package:nti_shopping_app/feature/favourite/data/repo/repo/favourite_repo_imp.dart'
    as _i598;
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_data_source_interface.dart'
    as _i331;
import 'package:nti_shopping_app/feature/favourite/domain/repo/favourite_repo_interface.dart'
    as _i481;
import 'package:nti_shopping_app/feature/favourite/domain/use_case/get_favourite_use_case.dart'
    as _i741;
import 'package:nti_shopping_app/feature/favourite/domain/use_case/remove_favourite_use_case.dart'
    as _i887;
import 'package:nti_shopping_app/feature/favourite/presentation/view_model/cubit/favourite_cubit.dart'
    as _i122;
import 'package:nti_shopping_app/feature/home/data/api/home_api_imp.dart'
    as _i1038;
import 'package:nti_shopping_app/feature/home/data/api/home_api_interface.dart'
    as _i305;
import 'package:nti_shopping_app/feature/home/data/repo/home_data_source_imp.dart'
    as _i478;
import 'package:nti_shopping_app/feature/home/data/repo/home_repo_imp.dart'
    as _i416;
import 'package:nti_shopping_app/feature/home/domain/repo/home_data_source_interface.dart'
    as _i1050;
import 'package:nti_shopping_app/feature/home/domain/repo/home_repo_interface.dart'
    as _i869;
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_categories_use_case.dart'
    as _i884;
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_products_use_case.dart'
    as _i72;
import 'package:nti_shopping_app/feature/home/presentation/view_model/home_cubit.dart'
    as _i570;
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
    final registerModules = _$RegisterModules();
    gh.factory<_i558.FlutterSecureStorage>(() => registerModules.storage);
    gh.factory<_i331.FavouriteDataSourceInterface>(
      () => _i522.FavouriteDataSourceImp(),
    );
    gh.factory<_i558.ProductsByCategoryApiInterface>(
      () => _i60.ProductsByCategoryApiImp(),
    );
    gh.factory<_i949.ProductsByCategoryDataSourceInterface>(
      () => _i465.ProductsByCategoryDataSourceImp(
        api: gh<_i558.ProductsByCategoryApiInterface>(),
      ),
    );
    gh.lazySingleton<_i835.AppSecureStorage>(
      () => _i835.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i481.FavouriteRepoInterface>(
      () => _i598.FavouriteRepoImp(
        dataSource: gh<_i331.FavouriteDataSourceInterface>(),
      ),
    );
    gh.factory<_i887.RemoveFavouriteUseCase>(
      () => _i887.RemoveFavouriteUseCase(gh<_i481.FavouriteRepoInterface>()),
    );
    gh.lazySingleton<_i383.StartupHelper>(
      () => _i383.StartupHelper(gh<_i835.AppSecureStorage>()),
    );
    gh.factory<_i994.ProductsByCategoryRepoInterface>(
      () => _i762.ProductsByCategoryRepoImp(
        dataSource: gh<_i949.ProductsByCategoryDataSourceInterface>(),
      ),
    );
    gh.factory<_i741.GetFavouriteUseCase>(
      () => _i741.GetFavouriteUseCase(
        favouriteRepo: gh<_i481.FavouriteRepoInterface>(),
      ),
    );
    gh.factory<_i305.HomeApiInterface>(
      () => _i1038.HomeApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i394.ProductsByCategoryGetUsecase>(
      () => _i394.ProductsByCategoryGetUsecase(
        categoryProductsRepo: gh<_i994.ProductsByCategoryRepoInterface>(),
      ),
    );
    gh.factory<_i122.FavouriteCubit>(
      () => _i122.FavouriteCubit(
        gh<_i741.GetFavouriteUseCase>(),
        gh<_i887.RemoveFavouriteUseCase>(),
      ),
    );
    gh.factory<_i1050.HomeDataSourceInterface>(
      () => _i478.HomeDataSourceImp(gh<_i305.HomeApiInterface>()),
    );
    gh.factory<_i873.ProductsByCategoryCubit>(
      () => _i873.ProductsByCategoryCubit(
        gh<_i394.ProductsByCategoryGetUsecase>(),
      ),
    );
    gh.factory<_i869.HomeRepoInterface>(
      () => _i416.HomeRepoImp(gh<_i1050.HomeDataSourceInterface>()),
    );
    gh.factory<_i884.GetAllCategoriesUseCase>(
      () => _i884.GetAllCategoriesUseCase(gh<_i869.HomeRepoInterface>()),
    );
    gh.factory<_i72.GetAllProductsUseCase>(
      () => _i72.GetAllProductsUseCase(gh<_i869.HomeRepoInterface>()),
    );
    gh.factory<_i570.HomeCubit>(
      () => _i570.HomeCubit(
        gh<_i72.GetAllProductsUseCase>(),
        gh<_i884.GetAllCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModules extends _i1044.RegisterModules {}
