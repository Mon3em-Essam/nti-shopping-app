import 'package:nti_shopping_app/feature/account/data/domain/entities/account_entity.dart';

abstract class AccountState {}

class AccountInitial extends AccountState {}

class AccountLoading extends AccountState {}

class AccountSuccess extends AccountState {
  final AccountEntity account;
  AccountSuccess(this.account);
}

class AccountError extends AccountState {
  final String message;
  AccountError(this.message);
}

class UpdateAccountLoading extends AccountState {}

class UpdateAccountSuccess extends AccountState {}

class UpdateAccountError extends AccountState {
  final String message;
  UpdateAccountError(this.message);
}