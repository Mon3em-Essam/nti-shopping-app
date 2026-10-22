import 'dart:io';
import '../../model/account_dto.dart';

abstract class AccountDataSourceInterface {
  Future<AccountDto> getAccountData();

  Future<void> updateAccountData({
    required String name,
    required String email,
    required String phone,
    File? image,
  });
}