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
import 'package:nti_shopping_app/feature/account/data/domain/repo/account_repo_imp.dart'
    as _i216;
import 'package:nti_shopping_app/feature/account/data/domain/repo/account_repo_interface.dart'
    as _i403;
import 'package:nti_shopping_app/feature/account/data/domain/use_case/get_account_use_case.dart'
    as _i564;
import 'package:nti_shopping_app/feature/account/data/domain/use_case/update_account_use_case.dart'
    as _i103;
import 'package:nti_shopping_app/feature/account/data/repo/data_source/account_data_source_imp.dart'
    as _i42;
import 'package:nti_shopping_app/feature/account/data/repo/data_source/account_data_source_interface.dart'
    as _i587;
import 'package:nti_shopping_app/feature/account/presentation/view_model/account_cubit.dart'
    as _i70;
import 'package:nti_shopping_app/feature/auth/data/api/auth_api_imp.dart'
    as _i325;
import 'package:nti_shopping_app/feature/auth/data/api/auth_api_interface.dart'
    as _i254;
import 'package:nti_shopping_app/feature/auth/data/repo/auth_data_source_imp.dart'
    as _i486;
import 'package:nti_shopping_app/feature/auth/data/repo/auth_repo_imp.dart'
    as _i468;
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_data_source_interface.dart'
    as _i342;
import 'package:nti_shopping_app/feature/auth/domain/repo/auth_repo_interface.dart'
    as _i201;
import 'package:nti_shopping_app/feature/auth/domain/use_case/login_use_case.dart'
    as _i126;
import 'package:nti_shopping_app/feature/auth/presentation/view_model/login_cubit.dart'
    as _i155;
import 'package:nti_shopping_app/feature/cart/data/api/cart_api_imp.dart'
    as _i339;
import 'package:nti_shopping_app/feature/cart/data/api/cart_api_interface.dart'
    as _i925;
import 'package:nti_shopping_app/feature/cart/data/repo/data_source/cart_data_source_imp.dart'
    as _i159;
import 'package:nti_shopping_app/feature/cart/data/repo/repo/cart_repo_imp.dart'
    as _i236;
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_data_source_interface.dart'
    as _i242;
import 'package:nti_shopping_app/feature/cart/domain/repo/cart_repo_interface.dart'
    as _i489;
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_add_use_case.dart'
    as _i454;
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_delete_use_case.dart'
    as _i963;
import 'package:nti_shopping_app/feature/cart/domain/use_case/cart_get_use_case.dart'
    as _i889;
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_add_cubit/cart_add_cubit.dart'
    as _i402;
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_get_cubit/cart_get_cubit.dart'
    as _i4;
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
import 'package:nti_shopping_app/feature/search/data/api/search_api_imp.dart'
    as _i244;
import 'package:nti_shopping_app/feature/search/data/api/search_api_interface.dart'
    as _i483;
import 'package:nti_shopping_app/feature/search/data/repo/search_data_source_imp.dart'
    as _i450;
import 'package:nti_shopping_app/feature/search/data/repo/search_repo_imp.dart'
    as _i950;
import 'package:nti_shopping_app/feature/search/domain/repo/search_data_source_interface.dart'
    as _i522;
import 'package:nti_shopping_app/feature/search/domain/repo/search_repo_interface.dart'
    as _i305;
import 'package:nti_shopping_app/feature/search/domain/use_case/search_use_case.dart'
    as _i661;
import 'package:nti_shopping_app/feature/search/presentation/view_model/search_cubit.dart'
    as _i179;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModules = _$RegisterModules();
    gh.factory<_i558.FlutterSecureStorage>(() => registerModules.storage);
    gh.factory<_i587.AccountDataSourceInterface>(
      () => _i42.AccountDataSourceImp(),
    );
    gh.factory<_i254.AuthApiInterface>(() => _i325.AuthApiImp());
    gh.factory<_i342.AuthDataSourceInterface>(
      () => _i486.AuthDataSourceImp(gh<_i254.AuthApiInterface>()),
    );
    gh.lazySingleton<_i835.AppSecureStorage>(
      () => _i835.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i201.AuthRepoInterface>(
      () => _i468.AuthRepoImp(gh<_i342.AuthDataSourceInterface>()),
    );
    gh.factory<_i403.AccountRepoInterface>(
      () => _i216.AccountRepoImp(gh<_i587.AccountDataSourceInterface>()),
    );
    gh.lazySingleton<_i383.StartupHelper>(
      () => _i383.StartupHelper(gh<_i835.AppSecureStorage>()),
    );
    gh.factory<_i564.GetAccountUseCase>(
      () => _i564.GetAccountUseCase(gh<_i403.AccountRepoInterface>()),
    );
    gh.factory<_i103.UpdateAccountUseCase>(
      () => _i103.UpdateAccountUseCase(gh<_i403.AccountRepoInterface>()),
    );
    gh.factory<_i305.HomeApiInterface>(
      () => _i1038.HomeApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i483.SearchApiInterface>(
      () => _i244.SearchApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i126.LoginUseCase>(
      () => _i126.LoginUseCase(gh<_i201.AuthRepoInterface>()),
    );
    gh.factory<_i155.LoginCubit>(
      () =>
          _i155.LoginCubit(gh<_i126.LoginUseCase>(), gh<_i383.StartupHelper>()),
    );
    gh.factory<_i558.ProductsByCategoryApiInterface>(
      () => _i60.ProductsByCategoryApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i925.CartApiInterface>(
      () => _i339.CartApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i70.AccountCubit>(
      () => _i70.AccountCubit(
        gh<_i564.GetAccountUseCase>(),
        gh<_i103.UpdateAccountUseCase>(),
      ),
    );
    gh.factory<_i242.CartDataSourceInterface>(
      () => _i159.CartDataSourceImp(gh<_i925.CartApiInterface>()),
    );
    gh.factory<_i1050.HomeDataSourceInterface>(
      () => _i478.HomeDataSourceImp(gh<_i305.HomeApiInterface>()),
    );
    gh.factory<_i489.CartRepoInterface>(
      () => _i236.CartRepoImp(gh<_i242.CartDataSourceInterface>()),
    );
    gh.factory<_i522.SearchDataSourceInterface>(
      () => _i450.SearchDataSourceImp(gh<_i483.SearchApiInterface>()),
    );
    gh.factory<_i949.ProductsByCategoryDataSourceInterface>(
      () => _i465.ProductsByCategoryDataSourceImp(
        api: gh<_i558.ProductsByCategoryApiInterface>(),
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
    gh.factory<_i454.CartAddUseCase>(
      () => _i454.CartAddUseCase(gh<_i489.CartRepoInterface>()),
    );
    gh.factory<_i963.CartDeleteUseCase>(
      () => _i963.CartDeleteUseCase(gh<_i489.CartRepoInterface>()),
    );
    gh.factory<_i889.CartGetUseCase>(
      () => _i889.CartGetUseCase(gh<_i489.CartRepoInterface>()),
    );
    gh.factory<_i305.SearchRepoInterface>(
      () => _i950.SearchRepoImp(gh<_i522.SearchDataSourceInterface>()),
    );
    gh.factory<_i661.SearchUseCase>(
      () => _i661.SearchUseCase(gh<_i305.SearchRepoInterface>()),
    );
    gh.factory<_i4.CartGetCubit>(
      () => _i4.CartGetCubit(gh<_i889.CartGetUseCase>()),
    );
    gh.factory<_i994.ProductsByCategoryRepoInterface>(
      () => _i762.ProductsByCategoryRepoImp(
        dataSource: gh<_i949.ProductsByCategoryDataSourceInterface>(),
      ),
    );
    gh.factory<_i402.CartAddCubit>(
      () => _i402.CartAddCubit(gh<_i454.CartAddUseCase>()),
    );
    gh.factory<_i179.SearchCubit>(
      () => _i179.SearchCubit(gh<_i661.SearchUseCase>()),
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

class _$RegisterModules extends _i1044.RegisterModules {}
