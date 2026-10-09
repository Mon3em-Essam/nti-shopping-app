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
import 'package:nti_shopping_app/feature/home/data/api/home_api_imp.dart'
    as _i154;
import 'package:nti_shopping_app/feature/home/data/api/home_api_interface.dart'
    as _i283;
import 'package:nti_shopping_app/feature/home/data/repo/home_data_source_imp.dart'
    as _i377;
import 'package:nti_shopping_app/feature/home/data/repo/home_repo_imp.dart'
    as _i783;
import 'package:nti_shopping_app/feature/home/domain/repo/home_data_source_interface.dart'
    as _i819;
import 'package:nti_shopping_app/feature/home/domain/repo/home_repo_interface.dart'
    as _i199;
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_categories_use_case.dart'
    as _i425;
import 'package:nti_shopping_app/feature/home/domain/use_case/get_all_products_use_case.dart'
    as _i413;
import 'package:nti_shopping_app/feature/home/presentation/view_model/home_cubit.dart'
    as _i348;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModules = _$RegisterModules();
    gh.factory<_i558.FlutterSecureStorage>(() => registerModules.storage);
    gh.lazySingleton<_i835.AppSecureStorage>(
      () => _i835.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i383.StartupHelper>(
      () => _i383.StartupHelper(gh<_i835.AppSecureStorage>()),
    );
    gh.factory<_i283.HomeApiInterface>(
      () => _i154.HomeApiImp(gh<_i383.StartupHelper>()),
    );
    gh.factory<_i819.HomeDataSourceInterface>(
      () => _i377.HomeDataSourceImp(gh<_i283.HomeApiInterface>()),
    );
    gh.factory<_i199.HomeRepoInterface>(
      () => _i783.HomeRepoImp(gh<_i819.HomeDataSourceInterface>()),
    );
    gh.factory<_i425.GetAllCategoriesUseCase>(
      () => _i425.GetAllCategoriesUseCase(gh<_i199.HomeRepoInterface>()),
    );
    gh.factory<_i413.GetAllProductsUseCase>(
      () => _i413.GetAllProductsUseCase(gh<_i199.HomeRepoInterface>()),
    );
    gh.factory<_i348.HomeCubit>(
      () => _i348.HomeCubit(
        gh<_i413.GetAllProductsUseCase>(),
        gh<_i425.GetAllCategoriesUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModules extends _i1044.RegisterModules {}
