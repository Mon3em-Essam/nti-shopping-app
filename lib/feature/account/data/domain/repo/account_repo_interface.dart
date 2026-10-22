import 'dart:io';
import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';


abstract class AccountRepoInterface {
  Future<AccountEntity> getAccountData();

  Future<void> updateAccountData({
    required String name,
    required String email,
    required String phone,
    File? image,
  });
}