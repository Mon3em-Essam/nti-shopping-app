import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';
import 'package:nti_shopping_app/feature/account/data/domain/repo/account_repo_interface.dart';
import 'package:nti_shopping_app/feature/account/data/model/account_dto.dart';
import 'package:nti_shopping_app/feature/account/data/repo/data_source/account_data_source_interface.dart';

@Injectable(as: AccountRepoInterface)
class AccountRepoImp implements AccountRepoInterface {
  final AccountDataSourceInterface dataSource;

  AccountRepoImp(this.dataSource);

  @override
  Future<AccountEntity> getAccountData() async {
    final AccountDto dto = await dataSource.getAccountData();
    final entity = dto.message?.toEntity();
    if (entity == null) {
      throw Exception('No account data');
    }
    return entity;
  }

  @override
  Future<void> updateAccountData({
    required String name,
    required String email,
    required String phone,
    File? image,
  }) {
    return dataSource.updateAccountData(
      name: name,
      email: email,
      phone: phone,
      image: image,
    );
  }
}